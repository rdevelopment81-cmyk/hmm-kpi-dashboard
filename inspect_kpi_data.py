import zipfile
import xml.etree.ElementTree as ET

with zipfile.ZipFile('kpi.xlsx.xlsx', 'r') as z:
    shared_strings = []
    if 'xl/sharedStrings.xml' in z.namelist():
        ss_xml = z.read('xl/sharedStrings.xml')
        ss_root = ET.fromstring(ss_xml)
        for si in ss_root.findall('{http://schemas.openxmlformats.org/spreadsheetml/2006/main}si'):
            text = ''.join(t.text or '' for t in si.findall('.//{http://schemas.openxmlformats.org/spreadsheetml/2006/main}t'))
            shared_strings.append(text)

    ns = {'m': 'http://schemas.openxmlformats.org/spreadsheetml/2006/main'}
    
    for sheet_name, sheet_path in [('Registrasi Kegiatan', 'xl/worksheets/sheet3.xml'),
                                   ('Jobdesk', 'xl/worksheets/sheet4.xml')]:
        print(f"=== {sheet_name} ===")
        s_xml = z.read(sheet_path)
        root = ET.fromstring(s_xml)
        
        # Headers from row 2
        r2 = next(r for r in root.findall('.//m:row', ns) if r.attrib.get('r') == '2')
        col_names = {}
        for c in r2.findall('m:c', ns):
            ref = c.attrib.get('r')
            col = ''.join(filter(str.isalpha, ref))
            t = c.attrib.get('t')
            v = c.find('m:v', ns)
            val = v.text if v is not None else ''
            if t == 's' and val.isdigit():
                val = shared_strings[int(val)]
            col_names[col] = val

        for c, n in sorted(col_names.items()):
            if n and not n.lower().startswith('persen') and not n.lower().startswith('presentase'):
                print(f"Col {c}: {n}")

        # Sample rows 3, 7, 10
        for r in root.findall('.//m:row', ns)[2:5]:
            row_dict = {}
            for c in r.findall('m:c', ns):
                ref = c.attrib.get('r')
                col = ''.join(filter(str.isalpha, ref))
                t = c.attrib.get('t')
                v = c.find('m:v', ns)
                val = v.text if v is not None else ''
                if t == 's' and val.isdigit():
                    val = shared_strings[int(val)]
                row_dict[col] = val
            print(f"Row {r.attrib.get('r')}: {row_dict.get('B')}")
            for col, col_name in col_names.items():
                if not col_name.lower().startswith('presentase') and not col_name.lower().startswith('persen'):
                    print(f"  {col_name} ({col}): {row_dict.get(col, '')}")
        print()

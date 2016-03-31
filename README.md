# KML-Parsing-Codeigniter

Example : 
function upload_kml(){
    $this->load->helper('xml');
		$file = file.kml;
  		
  	$xmlRaw = file_get_contents($file);
		$this->load->library('simplexml');
		
		$xmlData = $this->simplexml->xml_parse($xmlRaw);
		foreach ($xmlData['Folder']['Placemark'] as $key => $value) {
			$data = array();
			$string = "<?xml version='1.0'?> ".str_replace("<br>", "", $value['description'])."</table>";

			$xml = simplexml_load_string($string);
			$data['name'] = $value['name'];
			$data['visibility'] = $value['visibility'];
			$data['open'] = $value['open'][0];
			$data['linestyle_color'] = $value['Style']['LineStyle']['color'];
			$data['linestyle_width'] = $value['Style']['LineStyle']['width'];
			$data['polystyle_fill'] = $value['Style']['PolyStyle']['fill'];
			$data['polystyle_outline'] = $value['Style']['PolyStyle']['outline'];
			$data['polystyle_color'] = $value['Style']['PolyStyle']['color'];
			$data['extrude'] = $value['Polygon']['extrude'];
			$data['altitudemode'] = $value['Polygon']['altitudeMode'];
			$data['tessellate'] = $value['Polygon']['tessellate'];
			$data['coordinates'] = $value['Polygon']['outerBoundaryIs']['LinearRing']['coordinates'];

			foreach ($xml->tr as $kunci => $isi) {
				$data2 = (string)$isi->td[1];
				$data['desc_'.strtolower($isi->td[0])] = $data2;
			}
			/* Remove comment if you want save to database (this is sample only for POSTGRE [postgis])
			$coor = $value['Polygon']['outerBoundaryIs']['LinearRing']['coordinates'];
			$coors = explode(',0', $coor);
			$coordinates = '';
			foreach ($coors as $c) {
				if(!empty($c)){
					$coorxy = explode(',', $c);
					$coordinates[] = $coorxy[1].' '.$coorxy[0];
				}
			};
			$this->db->set('coordinates',"ST_GeomFromText('POLYGON((".implode(',',$coordinates)."))',4326)",false);
			$this->db->insert('site_bwa', $data);
			*/
		}
	}
	
	
	Danke :)

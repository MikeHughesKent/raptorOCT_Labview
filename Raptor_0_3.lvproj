<?xml version='1.0' encoding='UTF-8'?>
<Project Type="Project" LVVersion="16008000">
	<Item Name="My Computer" Type="My Computer">
		<Property Name="server.app.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.control.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="server.tcp.enabled" Type="Bool">false</Property>
		<Property Name="server.tcp.port" Type="Int">0</Property>
		<Property Name="server.tcp.serviceName" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.tcp.serviceName.default" Type="Str">My Computer/VI Server</Property>
		<Property Name="server.vi.callsEnabled" Type="Bool">true</Property>
		<Property Name="server.vi.propertiesEnabled" Type="Bool">true</Property>
		<Property Name="specify.custom.address" Type="Bool">false</Property>
		<Item Name="lib" Type="Folder">
			<Property Name="NI.SortType" Type="Int">3</Property>
			<Item Name="globals" Type="Folder">
				<Item Name="Channel 1 Image Ring.vi" Type="VI" URL="../lib/globals/Channel 1 Image Ring.vi"/>
				<Item Name="Channel 2 Image Ring.vi" Type="VI" URL="../lib/globals/Channel 2 Image Ring.vi"/>
			</Item>
			<Item Name="low level" Type="Folder">
				<Item Name="streamer" Type="Folder">
					<Item Name="img_write_image.vi" Type="VI" URL="../lib/low level/stream/img_write_image.vi"/>
					<Item Name="img_close_file.vi" Type="VI" URL="../lib/low level/stream/img_close_file.vi"/>
					<Item Name="img_open_file.vi" Type="VI" URL="../lib/low level/stream/img_open_file.vi"/>
					<Item Name="img_read_file_header.vi" Type="VI" URL="../lib/low level/stream/img_read_file_header.vi"/>
					<Item Name="img_read_image (2).vi" Type="VI" URL="../lib/low level/stream/img_read_image (2).vi"/>
					<Item Name="img_read_image.vi" Type="VI" URL="../lib/low level/stream/img_read_image.vi"/>
					<Item Name="img_update_frame_count.vi" Type="VI" URL="../lib/low level/stream/img_update_frame_count.vi"/>
					<Item Name="img_write_file_header.vi" Type="VI" URL="../lib/low level/stream/img_write_file_header.vi"/>
				</Item>
				<Item Name="add_to_ring_buffer.vi" Type="VI" URL="../lib/low level/add_to_ring_buffer.vi"/>
				<Item Name="build_en_face_interp_sequential.vi" Type="VI" URL="../lib/low level/build_en_face_interp_sequential.vi"/>
				<Item Name="check_expand_needed.vi" Type="VI" URL="../lib/low level/check_expand_needed.vi"/>
				<Item Name="circular_mask.vi" Type="VI" URL="../lib/low level/circular_mask.vi"/>
				<Item Name="create_image_array.vi" Type="VI" URL="../lib/low level/create_image_array.vi"/>
				<Item Name="cross_correlate.vi" Type="VI" URL="../lib/low level/cross_correlate.vi"/>
				<Item Name="expand_image_horizontal.vi" Type="VI" URL="../lib/low level/expand_image_horizontal.vi"/>
				<Item Name="extract_central.vi" Type="VI" URL="../lib/low level/extract_central.vi"/>
				<Item Name="extract_depth_range.vi" Type="VI" URL="../lib/low level/extract_depth_range.vi"/>
				<Item Name="extract_depth_range_fix_width.vi" Type="VI" URL="../lib/low level/extract_depth_range_fix_width.vi"/>
				<Item Name="fast_match.vi" Type="VI" URL="../lib/low level/fast_match.vi"/>
				<Item Name="find_surface_simple1.vi" Type="VI" URL="../lib/low level/find_surface_simple1.vi"/>
				<Item Name="find_surface_simple2.vi" Type="VI" URL="../lib/low level/find_surface_simple2.vi"/>
				<Item Name="For Loop Progress Bar.vi" Type="VI" URL="../lib/low level/For Loop Progress Bar.vi"/>
				<Item Name="gaussian_filter_kernel.vi" Type="VI" URL="../lib/low level/gaussian_filter_kernel.vi"/>
				<Item Name="get_filename_from_timestamp.vi" Type="VI" URL="../lib/low level/get_filename_from_timestamp.vi"/>
				<Item Name="load_avi_to_stack.vi" Type="VI" URL="../lib/low level/load_avi_to_stack.vi"/>
				<Item Name="load_tif_to_stack.vi" Type="VI" URL="../lib/low level/load_tif_to_stack.vi"/>
				<Item Name="masked_correlation.vi" Type="VI" URL="../lib/low level/masked_correlation.vi"/>
				<Item Name="pre_filter_image_8bit_dll.vi" Type="VI" URL="../lib/low level/pre_filter_image_8bit_dll.vi"/>
				<Item Name="speckle_mask.vi" Type="VI" URL="../lib/low level/speckle_mask.vi"/>
				<Item Name="add_line_to_enface.vi" Type="VI" URL="../lib/low level/add_line_to_enface.vi"/>
				<Item Name="add_line_to_enface_interp.vi" Type="VI" URL="../lib/low level/add_line_to_enface_interp.vi"/>
			</Item>
			<Item Name="typedef" Type="Folder">
				<Item Name="raptor_message.ctl" Type="VI" URL="../lib/typedef/raptor_message.ctl"/>
				<Item Name="raptor_image.ctl" Type="VI" URL="../lib/typedef/raptor_image.ctl"/>
				<Item Name="raptor_states.ctl" Type="VI" URL="../lib/typedef/raptor_states.ctl"/>
				<Item Name="raptor_state.ctl" Type="VI" URL="../lib/typedef/raptor_state.ctl"/>
				<Item Name="raptor_parameters.ctl" Type="VI" URL="../lib/typedef/raptor_parameters.ctl"/>
				<Item Name="build_record.ctl" Type="VI" URL="../lib/typedef/build_record.ctl"/>
			</Item>
			<Item Name="testers" Type="Folder">
				<Item Name="test_find_surface2.vi" Type="VI" URL="../lib/unit testers/test_find_surface2.vi"/>
				<Item Name="test_pre_filter_dll.vi" Type="VI" URL="../lib/unit testers/test_pre_filter_dll.vi"/>
				<Item Name="test_speckle_mask.vi" Type="VI" URL="../lib/unit testers/test_speckle_mask.vi"/>
				<Item Name="test_find_shift.vi" Type="VI" URL="../lib/unit testers/test_find_shift.vi"/>
			</Item>
			<Item Name="dll" Type="Folder">
				<Item Name="template_match.dll" Type="Document" URL="../lib/template_match.dll"/>
				<Item Name="Raptor.dll" Type="Document" URL="../lib/Raptor.dll"/>
			</Item>
			<Item Name="raptor.vi" Type="VI" URL="../lib/raptor.vi"/>
			<Item Name="raptor_build_enface.vi" Type="VI" URL="../lib/raptor_build_enface.vi"/>
			<Item Name="raptor_get_en_face.vi" Type="VI" URL="../lib/raptor_get_en_face.vi"/>
			<Item Name="raptor_get_fluorescence.vi" Type="VI" URL="../lib/raptor_get_fluorescence.vi"/>
			<Item Name="raptor_getlag.vi" Type="VI" URL="../lib/raptor_getlag.vi"/>
			<Item Name="raptor_initialise.vi" Type="VI" URL="../lib/raptor_initialise.vi"/>
			<Item Name="raptor_new_scan.vi" Type="VI" URL="../lib/raptor_new_scan.vi"/>
			<Item Name="raptor_send_images.vi" Type="VI" URL="../lib/raptor_send_images.vi"/>
			<Item Name="raptor_set_en_face_depth.vi" Type="VI" URL="../lib/raptor_set_en_face_depth.vi"/>
			<Item Name="raptor_shutdown.vi" Type="VI" URL="../lib/raptor_shutdown.vi"/>
			<Item Name="raptor_start.vi" Type="VI" URL="../lib/raptor_start.vi"/>
			<Item Name="raptor_stop.vi" Type="VI" URL="../lib/raptor_stop.vi"/>
			<Item Name="raptor_end_scan.vi" Type="VI" URL="../lib/raptor_end_scan.vi"/>
		</Item>
		<Item Name="test_raptor.vi" Type="VI" URL="../test_raptor.vi"/>
		<Item Name="Dependencies" Type="Dependencies">
			<Item Name="vi.lib" Type="Folder">
				<Item Name="Color (U64)" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Color (U64)"/>
				<Item Name="Color to RGB.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/colorconv.llb/Color to RGB.vi"/>
				<Item Name="High Resolution Relative Seconds.vi" Type="VI" URL="/&lt;vilib&gt;/Utility/High Resolution Relative Seconds.vi"/>
				<Item Name="Image Type" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Type"/>
				<Item Name="Image Unit" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/Image Unit"/>
				<Item Name="IMAQ AVI2 Close" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Close"/>
				<Item Name="IMAQ AVI2 Codec Path.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Codec Path.ctl"/>
				<Item Name="IMAQ AVI2 Get Info" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Get Info"/>
				<Item Name="IMAQ AVI2 Open" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Open"/>
				<Item Name="IMAQ AVI2 Read Frame" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Read Frame"/>
				<Item Name="IMAQ AVI2 Refnum.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Avi.llb/IMAQ AVI2 Refnum.ctl"/>
				<Item Name="IMAQ Copy" Type="VI" URL="/&lt;vilib&gt;/vision/Management.llb/IMAQ Copy"/>
				<Item Name="IMAQ Create" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Create"/>
				<Item Name="IMAQ Dispose" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ Dispose"/>
				<Item Name="IMAQ GetImageInfo" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageInfo"/>
				<Item Name="IMAQ GetImagePixelPtr" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImagePixelPtr"/>
				<Item Name="IMAQ GetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ GetImageSize"/>
				<Item Name="IMAQ Image.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Image.ctl"/>
				<Item Name="IMAQ ImageToArray" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ ImageToArray"/>
				<Item Name="IMAQ ReadFile" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ ReadFile"/>
				<Item Name="IMAQ Rounding Mode.ctl" Type="VI" URL="/&lt;vilib&gt;/vision/Image Controls.llb/IMAQ Rounding Mode.ctl"/>
				<Item Name="IMAQ SetImageSize" Type="VI" URL="/&lt;vilib&gt;/vision/Basics.llb/IMAQ SetImageSize"/>
				<Item Name="IMAQ Write BMP File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write BMP File 2"/>
				<Item Name="IMAQ Write File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write File 2"/>
				<Item Name="IMAQ Write Image And Vision Info File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write Image And Vision Info File 2"/>
				<Item Name="IMAQ Write JPEG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG File 2"/>
				<Item Name="IMAQ Write JPEG2000 File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write JPEG2000 File 2"/>
				<Item Name="IMAQ Write PNG File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write PNG File 2"/>
				<Item Name="IMAQ Write TIFF File 2" Type="VI" URL="/&lt;vilib&gt;/vision/Files.llb/IMAQ Write TIFF File 2"/>
				<Item Name="NI_AALBase.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALBase.lvlib"/>
				<Item Name="NI_AALPro.lvlib" Type="Library" URL="/&lt;vilib&gt;/Analysis/NI_AALPro.lvlib"/>
				<Item Name="NI_Gmath.lvlib" Type="Library" URL="/&lt;vilib&gt;/gmath/NI_Gmath.lvlib"/>
				<Item Name="NI_Vision_Development_Module.lvlib" Type="Library" URL="/&lt;vilib&gt;/vision/NI_Vision_Development_Module.lvlib"/>
			</Item>
			<Item Name="kernel32.dll" Type="Document" URL="kernel32.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="lvanlys.dll" Type="Document" URL="/&lt;resource&gt;/lvanlys.dll"/>
			<Item Name="nivision.dll" Type="Document" URL="nivision.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
			<Item Name="nivissvc.dll" Type="Document" URL="nivissvc.dll">
				<Property Name="NI.PreserveRelativePath" Type="Bool">true</Property>
			</Item>
		</Item>
		<Item Name="Build Specifications" Type="Build"/>
	</Item>
</Project>

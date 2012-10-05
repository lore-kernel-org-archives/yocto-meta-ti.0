Return-Path: <denis@denix.org>
Received: from vms173011pub.verizon.net (vms173011pub.verizon.net
	[206.46.173.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D1EFCE012F0
	for <meta-ti@yoctoproject.org>; Fri,  5 Oct 2012 08:59:52 -0700 (PDT)
Received: from gandalf.denix.org ([unknown] [72.66.25.115])
	by vms173011.mailsrvcs.net
	(Sun Java(tm) System Messaging Server 7u2-7.02 32bit (built Apr 16
	2009)) with ESMTPA id <0MBF004J7GF2X9E0@vms173011.mailsrvcs.net> for
	meta-ti@yoctoproject.org; Fri, 05 Oct 2012 10:59:27 -0500 (CDT)
Received: by gandalf.denix.org (Postfix, from userid 1000)	id 8E9D720088; Fri,
	05 Oct 2012 11:59:26 -0400 (EDT)
Date: Fri, 05 Oct 2012 11:59:26 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-id: <20121005155926.GB23366@denix.org>
References: <1346455197-18722-1-git-send-email-fcooper27jr@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C2D622E@DFLE09.ent.ti.com>
	<8F29D6B095ED194EA1980491A5E029710C2F7C7B@DFLE09.ent.ti.com>
MIME-version: 1.0
In-reply-to: <8F29D6B095ED194EA1980491A5E029710C2F7C7B@DFLE09.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Fri, 05 Oct 2012 15:59:53 -0000
Content-type: text/plain; charset=us-ascii
Content-disposition: inline

On Fri, Oct 05, 2012 at 05:01:04AM +0000, Cooper Jr., Franklin wrote:
> Please pull this patch into denzil.

Done

> -----Original Message-----
> From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-bounces@yoctoproject.org] On Behalf Of Cooper Jr., Franklin
> Sent: Monday, September 17, 2012 6:14 PM
> To: Franklin S. Cooper Jr; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
> 
> ping
> 
> -----Original Message-----
> From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com] 
> Sent: Friday, August 31, 2012 6:20 PM
> To: meta-ti@yoctoproject.org
> Cc: Cooper Jr., Franklin
> Subject: [meta-ti][PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
> 
> From: Franklin S. Cooper Jr <fcooper@ti.com>
> 
> * Newer versions of libgles-omap3 utilize a different PLATFORM value. This
>   patch allows the PLATFORM variable to be easily overridden if needed.
> * Replace the hardcoded usage of LinuxOMAP3 with the PLATFORM variable.
> 
> Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> ---
>  recipes-graphics/libgles/libgles-omap3.inc |   41 ++++++++++++++-------------
>  1 files changed, 21 insertions(+), 20 deletions(-)
> 
> diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> index 6137097..18ee7ff 100644
> --- a/recipes-graphics/libgles/libgles-omap3.inc
> +++ b/recipes-graphics/libgles/libgles-omap3.inc
> @@ -61,10 +61,11 @@ TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L$  -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
>  PARALLEL_MAKE = ""
>  
> +PLATFORM ?= "LinuxOMAP3"
> +
>  do_compile() {
>  	export X11ROOT="${STAGING_DIR_HOST}/usr"
>  	export TOOLCHAIN="${TOOLCHAIN_PATH}"
> -	export PLATFORM="LinuxOMAP3"
>  
>  	export PLAT_CC="${CC}"
>  	export PLAT_CPP="${CXX}"
> @@ -77,23 +78,23 @@ do_compile() {
>  	for X11BUILD in 0 1 ; do
>  		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
>  			cd $demo/OGLES/Build/LinuxGeneric
> -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> -			rm $demo/OGLES/Build/LinuxOMAP3/Release*/*.o
> -			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> +			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> +			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* 
> +${S}/demos/x11 || true
>  			sed -e s:NAME:$(basename $demo): \
> -			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/*): \
> +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename 
> +$demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
>  			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> -			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
> +			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* 
> +${S}/demos/raw || true
>  		done
>  		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
>  			cd $demo/OGLES2/Build/LinuxGeneric
> -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> -			rm -f $demo/OGLES2/Build/LinuxOMAP3/Release*/*.o
> -			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> +			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
> +			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* 
> +${S}/demos/x11 || true
>  			sed -e s:NAME:$(basename $demo): \
> -			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/*): \
> +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename 
> +$demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
>  			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> -			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
> +			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* 
> +${S}/demos/raw || true
>  		done
>  	done
>  
> @@ -109,14 +110,14 @@ do_compile() {
>  				cd $training/OGLES2/Build/LinuxGeneric
>  			fi
>  
> -			if [ -e $training/OGLES2/Build/LinuxOMAP3/Makefile ] ; then
> -				cd $training/OGLES2/Build/LinuxOMAP3
> +			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> +				cd $training/OGLES2/Build/${PLATFORM}
>  			fi			
>  
> -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> -			rm -f $training/OGLES2/Build/LinuxOMAP3/Release*/*.o
> -			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/trainingcourses/x11 || true
> -			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/trainingcourses/raw || true	
> +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> +			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> +			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
> +			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* 
> +${S}/trainingcourses/raw || true
>  		done
>  	done
>  
> @@ -137,7 +138,7 @@ do_install () {
>  	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
>  
>  	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
> -	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
> +	cp -pPR 
> +${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11
> +WS* ${D}${libdir} || true
>  
>  	install -d ${D}${includedir}
>  	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/ @@ -145,8 +146,8 @@ do_install () {
>  
>  	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
>  	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
> -	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES/ || true
> -	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES2/ || true
> +	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
> +	cp -pPr 
> +${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/
> +GLES/* ${D}${includedir}/GLES2/ || true
>  	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
>  	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
>  	cp -pPr ${S}/include/*.h ${D}${includedir} || true
> --
> 1.7.0.4
> 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti
> 


Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 49FACE0027E
	for <meta-ti@yoctoproject.org>; Tue, 25 Sep 2012 10:32:57 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q8PHWrNM007223;
	Tue, 25 Sep 2012 12:32:53 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q8PHWr7M019577;
	Tue, 25 Sep 2012 12:32:53 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 25 Sep 2012 12:32:53 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q8PHWqm3006747;
	Tue, 25 Sep 2012 12:32:52 -0500
Date: Tue, 25 Sep 2012 13:32:52 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: "Cooper Jr., Franklin" <fcooper@ti.com>
Message-ID: <20120925173252.GC16550@edge>
References: <1346455197-18722-1-git-send-email-fcooper27jr@gmail.com>
	<8F29D6B095ED194EA1980491A5E029710C2D622E@DFLE09.ent.ti.com>
	<20120918003957.GC1708@edge>
	<8F29D6B095ED194EA1980491A5E029710C2DBA09@DFLE09.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <8F29D6B095ED194EA1980491A5E029710C2DBA09@DFLE09.ent.ti.com>
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
X-List-Received-Date: Tue, 25 Sep 2012 17:32:57 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Sep 22, 2012 at 03:39:19PM -0400, Cooper Jr., Franklin wrote:
> I just built libgles-omap3_4.05.00.03 and installed it on my evm and 
> everything was fine with this modification. It is not necessary to have the 
> export PLATFORM statement since passing the PLATFORM variable as a make 
> option has precedence over the environment variable.

Ok, if nobody else has any comments or objections, I'd like to push this 
change in later today. Thanks.

-- 
Denys


> -----Original Message-----
> From: Dmytriyenko, Denys 
> Sent: Monday, September 17, 2012 7:40 PM
> To: Cooper Jr., Franklin
> Cc: Franklin S. Cooper Jr; meta-ti@yoctoproject.org
> Subject: Re: [meta-ti] [PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
> 
> On Mon, Sep 17, 2012 at 11:13:31PM +0000, Cooper Jr., Franklin wrote:
> > ping
> 
> See inline.
> 
> 
> > -----Original Message-----
> > From: Franklin S. Cooper Jr [mailto:fcooperjr27@gmail.com]
> > Sent: Friday, August 31, 2012 6:20 PM
> > To: meta-ti@yoctoproject.org
> > Cc: Cooper Jr., Franklin
> > Subject: [meta-ti][PATCH] libgles-omap3.inc: Tweak PLATFORM variable.
> > 
> > From: Franklin S. Cooper Jr <fcooper@ti.com>
> > 
> > * Newer versions of libgles-omap3 utilize a different PLATFORM value. This
> >   patch allows the PLATFORM variable to be easily overridden if needed.
> > * Replace the hardcoded usage of LinuxOMAP3 with the PLATFORM variable.
> > 
> > Signed-off-by: Franklin S. Cooper Jr <fcooper@ti.com>
> > ---
> >  recipes-graphics/libgles/libgles-omap3.inc |   41 ++++++++++++++-------------
> >  1 files changed, 21 insertions(+), 20 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/libgles-omap3.inc 
> > b/recipes-graphics/libgles/libgles-omap3.inc
> > index 6137097..18ee7ff 100644
> > --- a/recipes-graphics/libgles/libgles-omap3.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3.inc
> > @@ -61,10 +61,11 @@ TARGET_CC_ARCH += " ${TARGET_LINK_HASH_STYLE} -Wl,-rpath-link,${BINLOCATION} -L$  -L${STAGING_DIR_TARGET}${libdir} -Wl,-rpath-link,${STAGING_DIR_TARGET}${libdir}"
> >  PARALLEL_MAKE = ""
> >  
> > +PLATFORM ?= "LinuxOMAP3"
> > +
> >  do_compile() {
> >  	export X11ROOT="${STAGING_DIR_HOST}/usr"
> >  	export TOOLCHAIN="${TOOLCHAIN_PATH}"
> > -	export PLATFORM="LinuxOMAP3"
> 
> Franklin,
> 
> Have you verified that the old version doesn't expect the PLATFORM to be a defined environment variable during the build time, instead of being only the Makefile variable?
> 
> --
> Denys
> 
> 
> >  	export PLAT_CC="${CC}"
> >  	export PLAT_CPP="${CXX}"
> > @@ -77,23 +78,23 @@ do_compile() {
> >  	for X11BUILD in 0 1 ; do
> >  		for demo in ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Demos/* ; do
> >  			cd $demo/OGLES/Build/LinuxGeneric
> > -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> > -			rm $demo/OGLES/Build/LinuxOMAP3/Release*/*.o
> > -			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
> > +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> > +			rm $demo/OGLES/Build/${PLATFORM}/Release*/*.o
> > +			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseX11/* 
> > +${S}/demos/x11 || true
> >  			sed -e s:NAME:$(basename $demo): \
> > -			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES/Build/LinuxOMAP3/ReleaseX11/*): \
> > +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename 
> > +$demo/OGLES/Build/${PLATFORM}/ReleaseX11/*): \
> >  			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> > -			install -m 0755 $demo/OGLES/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
> > +			install -m 0755 $demo/OGLES/Build/${PLATFORM}/ReleaseRaw/* 
> > +${S}/demos/raw || true
> >  		done
> >  		for demo in ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Demos/* ; do
> >  			cd $demo/OGLES2/Build/LinuxGeneric
> > -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> > -			rm -f $demo/OGLES2/Build/LinuxOMAP3/Release*/*.o
> > -			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/demos/x11 || true
> > +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> > +			rm -f $demo/OGLES2/Build/${PLATFORM}/Release*/*.o
> > +			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseX11/* 
> > +${S}/demos/x11 || true
> >  			sed -e s:NAME:$(basename $demo): \
> > -			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename $demo/OGLES2/Build/LinuxOMAP3/ReleaseX11/*): \
> > +			    -e s:EXEC:${bindir}/SGX/demos/X11/$(basename 
> > +$demo/OGLES2/Build/${PLATFORM}/ReleaseX11/*): \
> >  			     ${WORKDIR}/sample.desktop > ${WORKDIR}/$(basename $demo).desktop
> > -			install -m 0755 $demo/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/demos/raw || true	
> > +			install -m 0755 $demo/OGLES2/Build/${PLATFORM}/ReleaseRaw/* 
> > +${S}/demos/raw || true
> >  		done
> >  	done
> >  
> > @@ -109,14 +110,14 @@ do_compile() {
> >  				cd $training/OGLES2/Build/LinuxGeneric
> >  			fi
> >  
> > -			if [ -e $training/OGLES2/Build/LinuxOMAP3/Makefile ] ; then
> > -				cd $training/OGLES2/Build/LinuxOMAP3
> > +			if [ -e $training/OGLES2/Build/${PLATFORM}/Makefile ] ; then
> > +				cd $training/OGLES2/Build/${PLATFORM}
> >  			fi			
> >  
> > -			oe_runmake Common=1 PLATFORM=$PLATFORM X11BUILD=$X11BUILD  
> > -			rm -f $training/OGLES2/Build/LinuxOMAP3/Release*/*.o
> > -			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseX11/* ${S}/trainingcourses/x11 || true
> > -			install -m 0755 $training/OGLES2/Build/LinuxOMAP3/ReleaseRaw/* ${S}/trainingcourses/raw || true	
> > +			oe_runmake Common=1 PLATFORM=${PLATFORM} X11BUILD=$X11BUILD
> > +			rm -f $training/OGLES2/Build/${PLATFORM}/Release*/*.o
> > +			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseX11/* ${S}/trainingcourses/x11 || true
> > +			install -m 0755 $training/OGLES2/Build/${PLATFORM}/ReleaseRaw/* 
> > +${S}/trainingcourses/raw || true
> >  		done
> >  	done
> >  
> > @@ -137,7 +138,7 @@ do_install () {
> >  	install -m 0755 ${BINLOCATION}/xgles1test1 ${D}${bindir}/
> >  
> >  	install -m 0755 ${BINLOCATION}/freedesktop/kdrive/usr/X11R6_SGX/bin/Xsgx ${D}${bindir}/|| true
> > -	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/lib/*X11WS* ${D}${libdir} || true
> > +	cp -pPR 
> > +${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/lib/*X11
> > +WS* ${D}${libdir} || true
> >  
> >  	install -d ${D}${includedir}
> >  	cp -pPR ${S}/GFX_Linux_KM/include4 ${D}${includedir}/ @@ -145,8 +146,8 @@ do_install () {
> >  
> >  	cp -pPR ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/Include/* ${D}${includedir}/
> >  	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/Include/* ${D}${includedir}/
> > -	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES/ || true
> > -	cp -pPr ${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/LinuxOMAP3/Include/GLES/* ${D}${includedir}/GLES2/ || true
> > +	cp -pPR ${S}/GFX_Linux_SDK/OGLES/SDKPackage/Builds/OGLES/${PLATFORM}/Include/GLES/* ${D}${includedir}/GLES/ || true
> > +	cp -pPr 
> > +${S}/GFX_Linux_SDK/OGLES2/SDKPackage/Builds/OGLES2/${PLATFORM}/Include/
> > +GLES/* ${D}${includedir}/GLES2/ || true
> >  	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/v* ${D}${includedir}/ || true
> >  	cp -pPr ${S}/GFX_Linux_SDK/OVG/SDKPackage/Builds/OVG/Include/V* ${D}${includedir}/ || true
> >  	cp -pPr ${S}/include/*.h ${D}${includedir} || true
> > --
> > 1.7.0.4
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti


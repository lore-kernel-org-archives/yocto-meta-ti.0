Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 25DD1E01483
	for <meta-ti@yoctoproject.org>; Mon, 17 Jun 2013 14:10:27 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id r5HLAPK6029843;
	Mon, 17 Jun 2013 16:10:25 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id r5HLAPkC013099;
	Mon, 17 Jun 2013 16:10:25 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Mon, 17 Jun 2013 16:10:25 -0500
Received: from localhost (gtudedge.gt.design.ti.com [158.218.102.158])	by
	dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id r5HLAPMo024076;
	Mon, 17 Jun 2013 16:10:25 -0500
Date: Mon, 17 Jun 2013 17:10:24 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Prabindh Sundareson <prabindh@yahoo.com>
Message-ID: <20130617211024.GD12618@edge>
References: <1367501964-6294-1-git-send-email-prabu@ti.com>
	<1367501964-6294-6-git-send-email-prabu@ti.com>
	<20130514173131.GD31835@denix.org>
	<1368591321.48894.YahooMailNeo@web125603.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1368591321.48894.YahooMailNeo@web125603.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
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
X-List-Received-Date: Mon, 17 Jun 2013 21:10:28 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Prabu,

By "libraries that are dynamically loaded at runtime", do you mean shared 
libraries or rather libraries loaded with dlopen() [1]? The latter one would 
explain why they are not automatically handled by shlib code, as it only 
detects shared libraries, AFAIK...

[1] http://tldp.org/HOWTO/Program-Library-HOWTO/dl-libraries.html

-- 
Denys


On Tue, May 14, 2013 at 09:15:21PM -0700, Prabindh Sundareson wrote:
> Denys,
> 
> How can this be confirmed ? Any other list to ask ?
> 
> 
> regards
> Prabu
> 
> 
> ________________________________
>  From: Denys Dmytriyenko <denys@ti.com>
> To: Prabindh Sundareson <prabu@ti.com> 
> Cc: meta-ti@yoctoproject.org 
> Sent: Tuesday, May 14, 2013 11:01 PM
> Subject: Re: [meta-ti] [PATCH 06/10] libgles-omap3: Add missing RPROVIDES
>  
> 
> On Thu, May 02, 2013 at 07:09:20PM +0530, Prabindh Sundareson wrote:
> > RPROVIDES specifies the libraries that are dynamically loaded
> > at runtime. This patch fixes "no package provides libGLESv2.so" and
> > similar errors that occur when including packages like qtbase.
> 
> I'm still somewhat not sure about this patch. I know you had this problem with 
> Qt5, but I'm wondering if there's a bug with shlib handling in latest OE, as 
> you ususally don't need to specify shared libs in RPROVIDES...
> 
> 
> > Signed-off-by: Prabindh Sundareson <prabu@ti.com>
> > ---
> >  recipes-graphics/libgles/libgles-omap3.inc |    1 +
> >  1 files changed, 1 insertions(+), 0 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgles/libgles-omap3.inc b/recipes-graphics/libgles/libgles-omap3.inc
> > index d08a04d..c33062a 100644
> > --- a/recipes-graphics/libgles/libgles-omap3.inc
> > +++ b/recipes-graphics/libgles/libgles-omap3.inc
> > @@ -201,6 +201,7 @@ PRIVATE_LIBS_${PN}-es5 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so lib
> >  PRIVATE_LIBS_${PN}-es6 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
> >  PRIVATE_LIBS_${PN}-es8 = "libGLESv2.so libIMGegl.so libsrv_um.so libpvr2d.so libsrv_init.so libEGL.so libsrv_um_dri.so libglslcompiler.so libGLES_CM.so"
> >  
> > +RPROVIDES_${PN} += "libGLESv2.so libEGL.so libGLES_CM.so libpvr2d.so libIMGegl.so libsrv_init.so libsrv_um.so libsrv_um_dri.so libglslcompiler.so"
> >  
> >  PACKAGES =+ "${PN}-blitwsegl ${PN}-flipwsegl ${PN}-frontwsegl ${PN}-linuxfbwsegl"
> >  
> > -- 
> > 1.7.1
> > 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> > 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


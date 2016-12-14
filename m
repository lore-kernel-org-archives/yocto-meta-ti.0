Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5F0C3E00D55; Tue, 13 Dec 2016 18:08:30 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-0.8 required=5.0 tests=BAYES_00, URI_HEX autolearn=no
	version=3.3.1
X-Spam-HAM-Report: * 1.1 URI_HEX URI: URI hostname has long hexadecimal
	sequence
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 162 seconds by postgrey-1.32 at yocto-www;
	Tue, 13 Dec 2016 18:08:28 PST
Received: from lelnx193.ext.ti.com (lelnx193.ext.ti.com [198.47.27.77])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B918CE00D0C
	for <meta-ti@yoctoproject.org>; Tue, 13 Dec 2016 18:08:28 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by lelnx193.ext.ti.com (8.15.1/8.15.1) with ESMTP id uBE25iLT012602;
	Tue, 13 Dec 2016 20:05:44 -0600
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBE25iXU027134;
	Tue, 13 Dec 2016 20:05:44 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Tue, 13 Dec 2016 20:05:44 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id uBE25iDB009395;
	Tue, 13 Dec 2016 20:05:44 -0600
Date: Tue, 13 Dec 2016 21:05:43 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Thomas Perrot <thomas.perrot@tupi.fr>
Message-ID: <20161214020543.GJ28380@edge>
References: <20161207193949.13288-1-thomas.perrot@tupi.fr>
	<20161207205154.GV28380@edge>
MIME-Version: 1.0
In-Reply-To: <20161207205154.GV28380@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] Fix build issue due at the use of bb.data instead of d: Exception: AttributeError: module 'bb.data' has no attribute 'getVar'
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
X-List-Received-Date: Wed, 14 Dec 2016 02:08:30 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Dec 07, 2016 at 03:51:54PM -0500, Denys Dmytriyenko wrote:
> Thanks, I've seen the API deprecation change in bitbake[1], but haven't had a 
> chance to make updates yet.
> BTW, your commit log got merged with the subject...

Ping. Would you like to fix your commit log or should I?


> [1] http://cgit.openembedded.org/bitbake/commit/?id=1825604d46fcd29fad6cfd325f1cb1e1b457d2c9
> 
> -- 
> Denys
> 
> 
> On Wed, Dec 07, 2016 at 08:39:49PM +0100, Thomas Perrot wrote:
> > Signed-off-by: Thomas Perrot <thomas.perrot@tupi.fr>
> > ---
> >  recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb     | 6 +++---
> >  recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb | 6 +++---
> >  recipes-ti/devtools/ti-cgt6x_8.1.0.bb                  | 8 ++++----
> >  3 files changed, 10 insertions(+), 10 deletions(-)
> > 
> > diff --git a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > index 45c8d519..394d1e4a 100644
> > --- a/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > +++ b/recipes-graphics/libgal/ti-gc320-libs_5.0.11.p7.bb
> > @@ -14,11 +14,11 @@ SRCREV = "ab0ca5bff345f6c13807fea3c4acabf5f2b9b10a"
> >  
> >  # There's only hardfp version available
> >  python __anonymous() {
> > -    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> > +    tunes = d.getVar("TUNE_FEATURES", d, 1)
> >      if not tunes:
> >          return
> > -    pkgn = bb.data.getVar("PN", d, 1)
> > -    pkgv = bb.data.getVar("PV", d, 1)
> > +    pkgn = d.getVar("PN", d, 1)
> > +    pkgv = d.getVar("PV", d, 1)
> >      if "callconvention-hard" not in tunes:
> >          bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> >          raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> > diff --git a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > index 770cda21..5cec40e8 100644
> > --- a/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > +++ b/recipes-graphics/libgles/ti-sgx-ddk-um_1.14.3699939.bb
> > @@ -12,11 +12,11 @@ SRCREV = "a5152f0b90bf3916eb1f478ac9fefe7d7ebe8bd9"
> >  
> >  # There's only hardfp version available
> >  python __anonymous() {
> > -    tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> > +    tunes = d.getVar("TUNE_FEATURES", d, 1)
> >      if not tunes:
> >          return
> > -    pkgn = bb.data.getVar("PN", d, 1)
> > -    pkgv = bb.data.getVar("PV", d, 1)
> > +    pkgn = d.getVar("PN", d, 1)
> > +    pkgv = d.getVar("PV", d, 1)
> >      if "callconvention-hard" not in tunes:
> >          bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> >          raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> > diff --git a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
> > index 79b562a9..5e97927b 100644
> > --- a/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
> > +++ b/recipes-ti/devtools/ti-cgt6x_8.1.0.bb
> > @@ -13,14 +13,14 @@ COMPATIBLE_HOST_class-target = "arm.*-linux"
> >  
> >  # For now we only have hardfp version for target class
> >  python __anonymous() {
> > -    c = bb.data.getVar("CLASSOVERRIDE", d, 1)
> > +    c = d.getVar("CLASSOVERRIDE", d, 1)
> >  
> >      if c == "class-target":
> > -        tunes = bb.data.getVar("TUNE_FEATURES", d, 1)
> > +        tunes = d.getVar("TUNE_FEATURES", d, 1)
> >          if not tunes:
> >              return
> > -        pkgn = bb.data.getVar("PN", d, 1)
> > -        pkgv = bb.data.getVar("PV", d, 1)
> > +        pkgn = d.getVar("PN", d, 1)
> > +        pkgv = d.getVar("PV", d, 1)
> >          if "callconvention-hard" not in tunes:
> >              bb.warn("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> >              raise bb.parse.SkipPackage("%s-%s ONLY supports hardfp mode for now" % (pkgn, pkgv))
> > -- 
> > 2.11.0
> > 
> > -- 
> > _______________________________________________
> > meta-ti mailing list
> > meta-ti@yoctoproject.org
> > https://lists.yoctoproject.org/listinfo/meta-ti
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


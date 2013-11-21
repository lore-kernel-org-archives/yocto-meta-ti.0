Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3AB6DE005BB
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 15:41:00 -0800 (PST)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id rALNexXN012602
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 17:40:59 -0600
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALNexxg003832
	for <meta-ti@yoctoproject.org>; Thu, 21 Nov 2013 17:40:59 -0600
Received: from dflp33.itg.ti.com (10.64.6.16) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.2.342.3;
	Thu, 21 Nov 2013 17:40:59 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp33.itg.ti.com (8.14.3/8.13.8) with ESMTP id rALNexoc015355;
	Thu, 21 Nov 2013 17:40:59 -0600
Date: Thu, 21 Nov 2013 18:40:58 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: "Ring, Chris" <cring@ti.com>
Message-ID: <20131121234058.GT29952@edge>
References: <20131120110538.GA22903@ti.com>
	<7D46E86EC0A8354091174257B2FED1015983FD3F@DLEE11.ent.ti.com>
	<20131120151843.GB29952@edge>
	<1C8E0AB07841D94E95FFFB7FCFE26FE00C7D2D14@DFLE10.ent.ti.com>
MIME-Version: 1.0
In-Reply-To: <1C8E0AB07841D94E95FFFB7FCFE26FE00C7D2D14@DFLE10.ent.ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH] ipc: IPC for communication between multiple processors
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
X-List-Received-Date: Thu, 21 Nov 2013 23:41:03 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Thu, Nov 21, 2013 at 06:38:55PM -0500, Ring, Chris wrote:
> Below...
> 
> > -----Original Message-----
> > From: Dmytriyenko, Denys
> > Sent: Wednesday, November 20, 2013 7:19 AM
> > To: Maupin, Chase
> > Cc: Hingolikar, Mrinmayee; meta-ti@yoctoproject.org; Ring, Chris; Nelson,
> > Sam
> > Subject: Re: [meta-ti] [PATCH] ipc: IPC for communication between multiple
> > processors
> > 
> > See my comments below.
> > 
> > <chop>
> > 
> > > >+
> > > >+Signed-off-by: Mrinmayee Hingolikar <mrinmayee@ti.com>
> > > >+---
> > > >+ ipc-linux.mak |    1 +
> > > >+ products.mak  |    1 +
> > > >+ 2 files changed, 2 insertions(+)
> > > >+
> > > >+diff --git a/ipc-linux.mak b/ipc-linux.mak
> > > >+index 788a5a2..01579e4 100644
> > > >+--- a/ipc-linux.mak
> > > >++++ b/ipc-linux.mak
> > > >+@@ -38,6 +38,7 @@ include products.mak
> > > >+ config:
> > > >+ 	@echo "Configuring Linux Ipc ..."
> > > >+ 	./configure --host=$(TOOLCHAIN_LONGNAME) \
> > > >++            --prefix=$(PREFIX) \
> > > >+             CC=$(TOOLCHAIN_PREFIX)gcc \
> > > >+             PLATFORM=$(PLATFORM) \
> > > >+             CMEM_INSTALL_DIR=$(CMEM_INSTALL_DIR) \
> > >
> > > This line makes me think there is a dependency missing.  In the past
> > > something like ti-paths.inc would pass this value along.  I'm not saying
> > > that should be replicated as is, but likely you want to se this to
> > > STAGING_DIR_TARGET or something similar and the cmem recipe should stage
> > > appropriately.
> > >
> > > I think it would be good if you walked through your software stack to
> > make
> > > sure you are sending your patches in order.  Likewise, there was some
> > > discussion with Sam about cmem recipes and basically about aligning
> > recipes
> > > between your groups.  I thin the approach of breaking linux-utils up
> > into a
> > > recipe per component is going to be the cleanest approach.  I'll ping on
> > > Sam's patches as well to get an update posted to meta-ti instead of
> > > meta-arago list.
> > >
> > > Any pointers you can provide to documentation about the configuration
> > and
> > > building of these components you are pushing up would also be useful to
> > help
> > > in reviewing so we can understand what you are trying to accomplish.
> > 
> > Nice catch. The first question - does it depend and require cmem?
> 
> The IPC build, including required variables, is described here:
>     http://processors.wiki.ti.com/index.php/IPC_Install_Guide_Linux
> 
> CMEM_INSTALL_DIR is only required if you want to build the examples which 
> leverage CMEM.  It shouldn't be needed if you only want to build the IPC 
> libraries.

Thanks, Chris!

Sam, Mrinmayee, can you comment on whether you need IPC examples and/or pass 
CMEM_INSTALL_DIR. Thanks.

-- 
Denys


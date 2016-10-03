Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id F270CE00D34; Mon,  3 Oct 2016 09:20:10 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from bear.ext.ti.com (bear.ext.ti.com [198.47.19.11])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B1EA9E00CFC
	for <meta-ti@yoctoproject.org>; Mon,  3 Oct 2016 09:20:06 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id u93GK4Rr025939
	for <meta-ti@yoctoproject.org>; Mon, 3 Oct 2016 11:20:04 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id u93GK4LY032375
	for <meta-ti@yoctoproject.org>; Mon, 3 Oct 2016 11:20:04 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.294.0;
	Mon, 3 Oct 2016 11:20:03 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id u93GK3aU022721;
	Mon, 3 Oct 2016 11:20:04 -0500
Date: Mon, 3 Oct 2016 12:20:03 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Sam Nelson <sam.nelson@ti.com>
Message-ID: <20161003162003.GA12745@edge>
References: <1474918148-21302-1-git-send-email-sam.nelson@ti.com>
	<20160930163521.GR7475@edge>
MIME-Version: 1.0
In-Reply-To: <20160930163521.GR7475@edge>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] ti-ipc-rtos: Remove M4F target for omap-a15
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
X-List-Received-Date: Mon, 03 Oct 2016 16:20:11 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Ping

On Fri, Sep 30, 2016 at 12:35:21PM -0400, Denys Dmytriyenko wrote:
> Sam,
> 
> This doesn't apply - can you please rebase?
> 
> -- 
> Denys
> 
> 
> On Mon, Sep 26, 2016 at 03:29:08PM -0400, Sam Nelson wrote:
> > - M4F target is not needed for omap-a15
> > - This reduces build time for platform associated with omap-a15
> > 
> > Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> > ---
> >  recipes-ti/ipc/ti-ipc-rtos_git.bb | 3 +--
> >  1 file changed, 1 insertion(+), 2 deletions(-)
> > 
> > diff --git a/recipes-ti/ipc/ti-ipc-rtos_git.bb b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > index 5b26436..c377b7b 100644
> > --- a/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > +++ b/recipes-ti/ipc/ti-ipc-rtos_git.bb
> > @@ -35,7 +35,7 @@ SRCREV_ipc-metadata = "b6dd82a450d75b9483a7cc9b619a30cf3cc25ae6"
> >  S_ipc-examples = "${WORKDIR}/git/ipc-examples"
> >  S_ipc-metadata = "${WORKDIR}/git/ipc-metadata"
> >  
> > -PR = "${INC_PR}.1"
> > +PR = "${INC_PR}.2"
> >  
> >  DEPENDS = "ti-xdctools ti-sysbios doxygen-native zip-native"
> >  DEPENDS_append_keystone = " ti-cgt6x-native \
> > @@ -61,7 +61,6 @@ IPC_TARGETS_omap-a15 = "\
> >      ti.targets.elf.C66="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> >      ti.targets.elf.C66_big_endian="${STAGING_DIR_NATIVE}/usr/share/ti/cgt-c6x" \
> >      ti.targets.arm.elf.M4="${M4_TOOLCHAIN_INSTALL_DIR}" \
> > -    ti.targets.arm.elf.M4F="${M4_TOOLCHAIN_INSTALL_DIR}" \
> >  "
> >  
> >  IPC_TARGETS_keystone = " \
> > -- 
> > 1.9.1
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


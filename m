Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A4857E00BC6; Tue, 15 Dec 2015 08:33:16 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [198.47.26.153 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 616C6E00546
	for <meta-ti@yoctoproject.org>; Tue, 15 Dec 2015 08:33:12 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id tBFGXAjJ006268;
	Tue, 15 Dec 2015 10:33:10 -0600
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFGXAms011186;
	Tue, 15 Dec 2015 10:33:10 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 15 Dec 2015 10:33:09 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id tBFGX9tt024634;
	Tue, 15 Dec 2015 10:33:09 -0600
Date: Tue, 15 Dec 2015 11:32:54 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Stefan =?iso-8859-1?Q?M=FCller-Klieser?= <s.mueller-klieser@phytec.de>
Message-ID: <20151215163253.GG23133@edge>
References: <1450093668-30879-1-git-send-email-sam.nelson@ti.com>
	<566EB0CE.5030706@phytec.de>
MIME-Version: 1.0
In-Reply-To: <566EB0CE.5030706@phytec.de>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH] linux-ti-staging: Work around to avoid race condition with external module
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
X-List-Received-Date: Tue, 15 Dec 2015 16:33:16 -0000
Content-Type: text/plain; charset="iso-8859-1"
Content-Disposition: inline
Content-Transfer-Encoding: 8bit

Stefan,

Yes, indeed, thanks.


Sam,

You only picked up part of the fix:
http://cgit.openembedded.org/openembedded-core/commit/?id=afcea61e8eb39234d336c706fdfd4680dea7c060

I don't want to overlay the entire module-base.bbclass, so I guess for our 
problematic out-of-tree modules we can just add this to their recipes:

do_configure[depends] += "virtual/kernel:do_compile_kernelmodules"

-- 
Denys


On Mon, Dec 14, 2015 at 01:06:38PM +0100, Stefan Müller-Klieser wrote:
> Hi,
> 
> this work around introduces another race condition, as you have to make
> sure every external module recipe depends on
> do_compile_kernelmodules, and not shared_workdir.
> 
> Regards,
> Stefan
> 
> 
> On 14.12.2015 12:47, Sam Nelson wrote:
> >- Currently there is an issue with compiling external kernel module
> >which depends on symbols from another kernel module which is part of the
> >list of modules configured to be built as modules in the default config.
> >- This work around allows to avoid the issue by copying the module
> >symbols to the kernel directory after making the kernel modules build.
> >- This issue is already fixed in oe-core: master branch as of date
> >- This is just work around before updating to latest oe-core
> >
> >Signed-off-by: Sam Nelson <sam.nelson@ti.com>
> >---
> >  recipes-kernel/linux/linux-ti-staging_3.14.bb | 4 ++++
> >  1 file changed, 4 insertions(+)
> >
> >diff --git a/recipes-kernel/linux/linux-ti-staging_3.14.bb b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> >index 54530e4..88950ae 100644
> >--- a/recipes-kernel/linux/linux-ti-staging_3.14.bb
> >+++ b/recipes-kernel/linux/linux-ti-staging_3.14.bb
> >@@ -65,3 +65,7 @@ KERNEL_GIT_PROTOCOL = "git"
> >  SRC_URI += "${KERNEL_GIT_URI};protocol=${KERNEL_GIT_PROTOCOL};branch=${BRANCH} \
> >              file://defconfig \
> >             "
> >+
> >+do_compile_kernelmodules_append() {
> >+	cp Module.symvers ${STAGING_KERNEL_BUILDDIR}/
> >+}
> >
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


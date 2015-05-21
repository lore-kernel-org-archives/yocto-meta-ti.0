Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 82189E0096A; Wed, 20 May 2015 19:00:31 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [198.47.26.152 listed in list.dnswl.org]
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 54EFBE005B9
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 19:00:24 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id t4L20M0e022743
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 21:00:22 -0500
Received: from DFLE72.ent.ti.com (dfle72.ent.ti.com [128.247.5.109])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4L20Mw4002680
	for <meta-ti@yoctoproject.org>; Wed, 20 May 2015 21:00:22 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE72.ent.ti.com
	(128.247.5.109) with Microsoft SMTP Server id 14.3.224.2;
	Wed, 20 May 2015 21:00:22 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t4L20Mp7029233;
	Wed, 20 May 2015 21:00:22 -0500
Date: Wed, 20 May 2015 22:00:21 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <20150521020021.GI31845@edge>
References: <1430245299-14096-1-git-send-email-j-stiffler@ti.com>
	<555CB1B7.1090002@ti.com>
MIME-Version: 1.0
In-Reply-To: <555CB1B7.1090002@ti.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/2] llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Thu, 21 May 2015 02:00:31 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

Well, this one is rather simple, unlike patch #2


On Wed, May 20, 2015 at 12:09:27PM -0400, Jacob Stiffler wrote:
> Ping.
> 
> On 4/28/2015 2:21 PM, Jacob Stiffler wrote:
> >Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> >---
> >  recipes-core/llvm/llvm-common.bbappend |    5 +++++
> >  1 file changed, 5 insertions(+)
> >  create mode 100644 recipes-core/llvm/llvm-common.bbappend
> >
> >diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
> >new file mode 100644
> >index 0000000..65de0d8
> >--- /dev/null
> >+++ b/recipes-core/llvm/llvm-common.bbappend
> >@@ -0,0 +1,5 @@
> >+PR_append = "-arago0"
> >+
> >+SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
> >+
> >+BBCLASSEXTEND += "nativesdk"
> 
> -- 
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


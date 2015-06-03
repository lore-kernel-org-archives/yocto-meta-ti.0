Return-Path: <denys@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 0FBC9E009EC; Tue,  2 Jun 2015 18:42:34 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at
	http://www.dnswl.org/, high *      trust
	*      [192.94.94.40 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 610DDE009CC
	for <meta-ti@yoctoproject.org>; Tue,  2 Jun 2015 18:42:32 -0700 (PDT)
Received: from dlelxv90.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id t531gUjJ000810;
	Tue, 2 Jun 2015 20:42:30 -0500
Received: from DLEE71.ent.ti.com (dlee71.ent.ti.com [157.170.170.114])
	by dlelxv90.itg.ti.com (8.14.3/8.13.8) with ESMTP id t531gUvw010503;
	Tue, 2 Jun 2015 20:42:30 -0500
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE71.ent.ti.com
	(157.170.170.114) with Microsoft SMTP Server id 14.3.224.2;
	Tue, 2 Jun 2015 20:42:30 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id t531gThD014537;
	Tue, 2 Jun 2015 20:42:30 -0500
Date: Tue, 2 Jun 2015 21:42:29 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Khem Raj <raj.khem@gmail.com>
Message-ID: <20150603014228.GQ16418@edge>
References: <20150601142306.8B3D552A3F@arago-project.org>
	<CAMKF1srahgFFVd8Z9D3wpRFHDTdfbnqg4P7sLDTbm2Q4mHXhOg@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAMKF1srahgFFVd8Z9D3wpRFHDTdfbnqg4P7sLDTbm2Q4mHXhOg@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>,
	Arago Project git <git@arago-project.org>
Subject: Re: Jacob Stiffler : llvm-common: Extend to nativesdk class.
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
X-List-Received-Date: Wed, 03 Jun 2015 01:42:34 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jun 01, 2015 at 11:12:38AM -0700, Khem Raj wrote:
> On Mon, Jun 1, 2015 at 7:23 AM, Arago Project git <git@arago-project.org> wrote:
> > Module: meta-ti
> > Branch: master
> > Commit: 5c880613a30351e8dfa815ed82740aa5012ef0d4
> > URL:    http://arago-project.org/git/meta-ti.git?a=commit;h=5c880613a30351e8dfa815ed82740aa5012ef0d4
> >
> > Author: Jacob Stiffler <j-stiffler@ti.com>
> > Date:   Wed May 27 16:52:16 2015 +0000
> >
> > llvm-common: Extend to nativesdk class.
> >
> > Signed-off-by: Jacob Stiffler <j-stiffler@ti.com>
> > Signed-off-by: Denys Dmytriyenko <denys@ti.com>
> >
> > ---
> >
> >  recipes-core/llvm/llvm-common.bbappend |    5 +++++
> >  1 files changed, 5 insertions(+), 0 deletions(-)
> >
> > diff --git a/recipes-core/llvm/llvm-common.bbappend b/recipes-core/llvm/llvm-common.bbappend
> > new file mode 100644
> > index 0000000..ffe4dcb
> > --- /dev/null
> > +++ b/recipes-core/llvm/llvm-common.bbappend
> > @@ -0,0 +1,5 @@
> > +PR_append = "-ti0"
> > +
> > +SYSROOT_PREPROCESS_FUNCS_append_class-nativesdk = " llvm_common_sysroot_preprocess"
> > +
> > +BBCLASSEXTEND += "nativesdk"
> >
> 
> this should be going into meta-oe ?

Good point! I missed the fact that llvm is not yet in oe-core, but instead is 
in meta-oe.

-- 
Denys


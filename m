Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web10.2383.1603322651008206313
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 16:24:11 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=ltZZpXOt;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
	by mail.yoctoproject.org (Postfix) with ESMTPS id E84C738C1143
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 16:24:09 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LNO9LT039114
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 18:24:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603322649;
	bh=fkOlHabaJT9VSKX69QyDziuGMYkOJIEn5486zPARP3g=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=ltZZpXOtHuymoHcYFRiBDjW8xMqPb6NbTLknxBe05V6lbDzm7V6s82w6IecfAAdtq
	 RtXfCz/Y/Ty546Ch81yikiKok89jdEQnJKrClmvMuNLfWp8jTxkRMnzoUbYCYJUKOB
	 nKG9xpTNeKC1c56QMG3yssiU+SrhRVbR6CnsRyPk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LNO8DX128053
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 18:24:08 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 18:24:08 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 18:24:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LNO8wV032398;
	Wed, 21 Oct 2020 18:24:08 -0500
Date: Wed, 21 Oct 2020 19:24:08 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
CC: Dan Murphy <dmurphy@ti.com>, <meta-ti@yoctoproject.org>,
        Gowtham Tammana
	<g-tammana@ti.com>
Subject: Re: [dunfell/master PATCH] ipc: ti-rpmsg-char: Add initial recipes
Message-ID: <20201021232408.GC14852@beryl>
References: <20201021135621.5073-1-s-anna@ti.com>
 <20201021204933.GY14852@beryl>
 <01c4c8f3-0484-59f8-c194-4b804bddaa97@ti.com>
MIME-Version: 1.0
In-Reply-To: <01c4c8f3-0484-59f8-c194-4b804bddaa97@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 05:09:38PM -0500, Suman Anna wrote:
> Hi Denys,
> 
> Thank you for the review comments.
> 
> On 10/21/20 3:49 PM, Denys Dmytriyenko wrote:
> > On Wed, Oct 21, 2020 at 08:56:21AM -0500, Suman Anna wrote:
> >> Add the initial recipes for building the ti-rpmsg-char package.
> >> The library and examples are built using two separate recipes
> >> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> >> ---
> >>  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 12 ++++++++++++
> >>  recipes-ti/ipc/ti-rpmsg-char.inc             | 19 +++++++++++++++++++
> >>  recipes-ti/ipc/ti-rpmsg-char_git.bb          | 11 +++++++++++
> >>  3 files changed, 42 insertions(+)
> >>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> >>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
> >>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
> >>
> >> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> >> new file mode 100644
> >> index 000000000000..1d86e95526cc
> >> --- /dev/null
> >> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> >> @@ -0,0 +1,12 @@
> >> +DESCRIPTION = "TI RPMsg Char Sample Applications and Tests"
> > 
> > SUMMARY is for short one-liner description of the package
> > DESCRIPTION is for longer, potentially multi-line detailed description
> > If only short one is used, then should be SUMMARY
> 
> OK, will update.
> 
> > 
> > 
> >> +require ti-rpmsg-char.inc
> >> +
> >> +DEPENDS = "ti-rpmsg-char"
> >> +RDEPENDS_${PN} = "ti-rpmsg-char"
> > 
> > This is redundant - build dependency automatically sets corresponding run-time 
> > dependency.
> 
> OK, will drop the RDEPENDS line.
> 
> > 
> > 
> >> +inherit autotools pkgconfig
> >> +
> >> +EXTRA_OEMAKE = "-C ${B}/examples"
> >> +
> >> +PR = "r0"
> >> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> >> new file mode 100644
> >> index 000000000000..454deea674b3
> >> --- /dev/null
> >> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> >> @@ -0,0 +1,19 @@
> >> +DESCRIPTION = "TI RPMsg Char Utility Library"
> > 
> > Same comment.
> 
> OK, will fix this as well.
> 
> > 
> > 
> >> +LICENSE = "BSD-3-Clause"
> >> +LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
> >> +
> >> +TI_RPMSG_CHAR_GIT_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git"
> >> +TI_RPMSG_CHAR_GIT_PROTOCOL = "git"
> >> +TI_RPMSG_CHAR_GIT_BRANCH = "master"
> > 
> > Any specific reason for these redirections? These were used by some recipes to 
> > be able to easily override these vars from outisde the recipe to point to some 
> > internal development tree... But even then there's another way to override 
> > those and don't use such indirect variables.
> 
> No specific reason, it was from an existing recipe I used as reference in
> creating this one. I can simplify by using the direct variables.
> 
> > 
> > E.g. instead of this in the local.conf:
> > 
> > TI_RPMSG_CHAR_GIT_BRANCH = "next"
> > 
> > One can do this:
> > 
> > BRANCH_pn-ti-rpmsg-char = "next"
> > BRANCH_pn-ti-rpmsg-char-examples = "next"
> 
> But do we even need to separate this out for the two packages? Is there an issue
> with just using,
> 
> BRANCH = "master"

In the recipe, yes. I was showing how you could override it from outside of 
the recipe to point it to "next" branch w/o using TI_RPMSG_CHAR_GIT_BRANCH.


> >> +# Initial 0.1.0 release
> >> +TI_RPMSG_CHAR_SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> >> +
> >> +BRANCH = "${TI_RPMSG_CHAR_GIT_BRANCH}"
> >> +SRC_URI = "${TI_RPMSG_CHAR_GIT_URI};protocol=${TI_RPMSG_CHAR_GIT_PROTOCOL};branch=${BRANCH};name=ti-rpmsg-char"
> > 
> > The part at the end is unnecessary - ;name=ti-rpmsg-char
> 
> OK
> 
> > 
> > 
> >> +SRCREV = "${TI_RPMSG_CHAR_SRCREV}"
> >> +
> >> +PV = "0.1.0+git${SRCPV}"
> >> +
> >> +S = "${WORKDIR}/git"
> >> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> >> new file mode 100644
> >> index 000000000000..c132a390f301
> >> --- /dev/null
> >> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> >> @@ -0,0 +1,11 @@
> >> +DESCRIPTION = "TI RPMsg Char Utility Library"
> >> +
> >> +require ti-rpmsg-char.inc
> >> +
> >> +DEPENDS += "virtual/kernel"
> >> +
> >> +inherit autotools pkgconfig
> >> +
> >> +do_compile[depends] += "virtual/kernel:do_shared_workdir"
> > 
> > How do you pass kernel location for the header file? Is it hardcoded in the 
> > Makefile?
> 
> The kernel header is from an already upstream driver, so is already exported and
> available on the host machine. I didn't have to pass any specific kernel path
> during the build, just the include line <linux/rpmsg.h> in the source code.

In that case you don't need extra dependencies - you can drop DEPENDS and 
do_compile[depends] lines. As linux/rpmsg.h file comes from the standard 
linux-libc-headers package, which is the default dependency.


> Granted, this might be needed on some older machines running an ancient kernel,
> that would need some additional conditionals to be added to the project build
> environment. I have added the do_compile for scalability if we end up adding
> functionality to the header from the kernel we are building.
> 
> regards
> Suman
> 
> > 
> > 
> >> +PR = "r0"
> >> -- 
> >> 2.28.0
> >>
> 

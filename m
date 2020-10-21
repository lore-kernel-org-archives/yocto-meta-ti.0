Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.329.1603313375461336945
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 21 Oct 2020 13:49:35 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=vacbtecq;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: denys@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 350DB38C1492
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 13:49:35 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09LKnYkR114806
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 15:49:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603313374;
	bh=cBNrCemiSX3CE8eqEeAeAVdtVk+d5Fv5oX/UTpeayh0=;
	h=Date:From:To:CC:Subject:References:In-Reply-To;
	b=vacbtecqVvuglYrfG2wAve7N3SYEJ3H36IsUOh1HgIfBA0wXvOrVsG1yOJG7OdpIf
	 86zI6woygYAJBQDsm+iPlb9Piei0D4jRHgwWfzG63W0Q8lQTSnE0ZrSO0UWTKB8DTE
	 EPVwZuSA5Wvk8yHrwCcRakjueNuaUUmgr1Sff5RI=
Received: from DFLE113.ent.ti.com (dfle113.ent.ti.com [10.64.6.34])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09LKnYxi048206
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 21 Oct 2020 15:49:34 -0500
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Wed, 21
 Oct 2020 15:49:34 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Wed, 21 Oct 2020 15:49:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09LKnXD3113991;
	Wed, 21 Oct 2020 15:49:34 -0500
Date: Wed, 21 Oct 2020 16:49:33 -0400
From: "Denys Dmytriyenko" <denys@ti.com>
To: Suman Anna <s-anna@ti.com>
CC: Dan Murphy <dmurphy@ti.com>, <meta-ti@yoctoproject.org>,
        Gowtham Tammana
	<g-tammana@ti.com>
Subject: Re: [dunfell/master PATCH] ipc: ti-rpmsg-char: Add initial recipes
Message-ID: <20201021204933.GY14852@beryl>
References: <20201021135621.5073-1-s-anna@ti.com>
MIME-Version: 1.0
In-Reply-To: <20201021135621.5073-1-s-anna@ti.com>
User-Agent: Mutt/1.5.24 (2015-08-30)
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Wed, Oct 21, 2020 at 08:56:21AM -0500, Suman Anna wrote:
> Add the initial recipes for building the ti-rpmsg-char package.
> The library and examples are built using two separate recipes
> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
> 
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
>  recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 12 ++++++++++++
>  recipes-ti/ipc/ti-rpmsg-char.inc             | 19 +++++++++++++++++++
>  recipes-ti/ipc/ti-rpmsg-char_git.bb          | 11 +++++++++++
>  3 files changed, 42 insertions(+)
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
>  create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
> 
> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> new file mode 100644
> index 000000000000..1d86e95526cc
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> @@ -0,0 +1,12 @@
> +DESCRIPTION = "TI RPMsg Char Sample Applications and Tests"

SUMMARY is for short one-liner description of the package
DESCRIPTION is for longer, potentially multi-line detailed description
If only short one is used, then should be SUMMARY


> +require ti-rpmsg-char.inc
> +
> +DEPENDS = "ti-rpmsg-char"
> +RDEPENDS_${PN} = "ti-rpmsg-char"

This is redundant - build dependency automatically sets corresponding run-time 
dependency.


> +inherit autotools pkgconfig
> +
> +EXTRA_OEMAKE = "-C ${B}/examples"
> +
> +PR = "r0"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> new file mode 100644
> index 000000000000..454deea674b3
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -0,0 +1,19 @@
> +DESCRIPTION = "TI RPMsg Char Utility Library"

Same comment.


> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
> +
> +TI_RPMSG_CHAR_GIT_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git"
> +TI_RPMSG_CHAR_GIT_PROTOCOL = "git"
> +TI_RPMSG_CHAR_GIT_BRANCH = "master"

Any specific reason for these redirections? These were used by some recipes to 
be able to easily override these vars from outisde the recipe to point to some 
internal development tree... But even then there's another way to override 
those and don't use such indirect variables.

E.g. instead of this in the local.conf:

TI_RPMSG_CHAR_GIT_BRANCH = "next"

One can do this:

BRANCH_pn-ti-rpmsg-char = "next"
BRANCH_pn-ti-rpmsg-char-examples = "next"


> +# Initial 0.1.0 release
> +TI_RPMSG_CHAR_SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> +
> +BRANCH = "${TI_RPMSG_CHAR_GIT_BRANCH}"
> +SRC_URI = "${TI_RPMSG_CHAR_GIT_URI};protocol=${TI_RPMSG_CHAR_GIT_PROTOCOL};branch=${BRANCH};name=ti-rpmsg-char"

The part at the end is unnecessary - ;name=ti-rpmsg-char


> +SRCREV = "${TI_RPMSG_CHAR_SRCREV}"
> +
> +PV = "0.1.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> new file mode 100644
> index 000000000000..c132a390f301
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> @@ -0,0 +1,11 @@
> +DESCRIPTION = "TI RPMsg Char Utility Library"
> +
> +require ti-rpmsg-char.inc
> +
> +DEPENDS += "virtual/kernel"
> +
> +inherit autotools pkgconfig
> +
> +do_compile[depends] += "virtual/kernel:do_shared_workdir"

How do you pass kernel location for the header file? Is it hardcoded in the 
Makefile?


> +PR = "r0"
> -- 
> 2.28.0
> 

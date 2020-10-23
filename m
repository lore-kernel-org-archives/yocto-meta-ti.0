Received: from mail.yoctoproject.org (mail.yoctoproject.org [198.145.29.25])
 by mx.groups.io with SMTP id smtpd.web11.8799.1603460417821131467
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 23 Oct 2020 06:40:18 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yQjgN+Dm;
 spf=fail (domain: ti.com, ip: 198.145.29.25, mailfrom: dmurphy@ti.com)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by mail.yoctoproject.org (Postfix) with ESMTPS id 89F1F38C06C2
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2020 06:40:17 -0700 (PDT)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 09NDeGPO035474
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2020 08:40:16 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1603460416;
	bh=F1KKfJZBrWzi6ssoKYtWb495Uwo3zAdb7p7PuDSVvvw=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=yQjgN+DmuiM7GiRkRSiWHWLL6QfF0tDIIiywEmPmry1U5YpyNhbkvvOF3PA3pdqjO
	 c3CDxM7mWyuPq+/DsSlXEUOs0OYIc7VihK82xBwCscll0jD1L0E7OqS/S9/sikbm/z
	 ljHTxJKhxo8od+Eww4CHQFcgiV3f71HkVo3+t1Zc=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 09NDeGcT129233
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Fri, 23 Oct 2020 08:40:16 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3; Fri, 23
 Oct 2020 08:40:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1979.3 via
 Frontend Transport; Fri, 23 Oct 2020 08:40:16 -0500
Received: from [10.250.39.65] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 09NDeGBQ029132;
	Fri, 23 Oct 2020 08:40:16 -0500
Subject: Re: [dunfell/master PATCH v2] ipc: ti-rpmsg-char: Add initial recipes
To: Suman Anna <s-anna@ti.com>, Denys Dmytriyenko <denys@ti.com>
CC: <meta-ti@yoctoproject.org>, Gowtham Tammana <g-tammana@ti.com>
References: <20201022005614.9344-1-s-anna@ti.com>
From: "Dan Murphy" <dmurphy@ti.com>
Message-ID: <c254f5a1-247c-8c28-5cc8-e68a9c316225@ti.com>
Date: Fri, 23 Oct 2020 08:40:11 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201022005614.9344-1-s-anna@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Suman

On 10/21/20 7:56 PM, Suman Anna wrote:
> Add the initial recipes for building the ti-rpmsg-char package.
> The library and examples are built using two separate recipes
> in ti-rpmsg-char_git.bb and ti-rpmsg-char-examples_git.bb.
>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Signed-off-by: Gowtham Tammana <g-tammana@ti.com>
> ---
> v2: Addressed review comments from Denys
>   - Dropped the DEPENDS and do_compile depends from ti-rpmsg-char_git.bb
>   - Dropped the RDEPENDS from ti-rpmsg-char-examples_git.bb
>   - Eliminated the TI_RPMSG_CHAR_GIT_xxx variables and redirection
>   - Replaced DESCRIPTION with SUMMARY
>
>   recipes-ti/ipc/ti-rpmsg-char-examples_git.bb | 11 +++++++++++
>   recipes-ti/ipc/ti-rpmsg-char.inc             | 15 +++++++++++++++
>   recipes-ti/ipc/ti-rpmsg-char_git.bb          |  7 +++++++
>   3 files changed, 33 insertions(+)
>   create mode 100644 recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
>   create mode 100644 recipes-ti/ipc/ti-rpmsg-char.inc
>   create mode 100644 recipes-ti/ipc/ti-rpmsg-char_git.bb
>
> diff --git a/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> new file mode 100644
> index 000000000000..142e5bf07ad7
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char-examples_git.bb
> @@ -0,0 +1,11 @@
> +SUMMARY = "TI RPMsg Char Sample Applications and Tests"
> +
> +require ti-rpmsg-char.inc
> +
> +DEPENDS = "ti-rpmsg-char"
> +
> +inherit autotools pkgconfig
> +
> +EXTRA_OEMAKE = "-C ${B}/examples"
> +
> +PR = "r0"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char.inc b/recipes-ti/ipc/ti-rpmsg-char.inc
> new file mode 100644
> index 000000000000..b41e68eba0f9
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char.inc
> @@ -0,0 +1,15 @@
> +SUMMARY = "TI RPMsg Char Utility Library"
> +
> +LICENSE = "BSD-3-Clause"
> +LIC_FILES_CHKSUM = "file://${S}/src/rpmsg_char.c;beginline=1;endline=31;md5=71987db43a2159cff5ea00505c6fce58"
> +
> +PROTOCOL = "git"
> +BRANCH = "master"
> +SRC_URI = "git://git.ti.com/rpmsg/ti-rpmsg-char.git;protocol=${PROTOCOL};branch=${BRANCH};"
> +
> +# Initial 0.1.0 release
> +SRCREV = "9be402c2bf4053900b6b9a8092fbb42e7e303108"
> +
> +PV = "0.1.0+git${SRCPV}"
> +
> +S = "${WORKDIR}/git"
> diff --git a/recipes-ti/ipc/ti-rpmsg-char_git.bb b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> new file mode 100644
> index 000000000000..63711a3b35dd
> --- /dev/null
> +++ b/recipes-ti/ipc/ti-rpmsg-char_git.bb
> @@ -0,0 +1,7 @@
> +SUMMARY = "TI RPMsg Char Utility Library"
> +
> +require ti-rpmsg-char.inc
> +
> +inherit autotools pkgconfig
> +
> +PR = "r0"

This has been applied

Dan


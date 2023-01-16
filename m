Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D6EE3C46467
	for <webhook@archiver.kernel.org>; Mon, 16 Jan 2023 17:08:38 +0000 (UTC)
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
 by mx.groups.io with SMTP id smtpd.web10.172585.1673888915236825894
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 16 Jan 2023 09:08:35 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=XzCIIBYu;
 spf=pass (domain: ti.com, ip: 198.47.19.142, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 30GH8Uqf031182;
	Mon, 16 Jan 2023 11:08:30 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1673888910;
	bh=kaYlnev8AHQvcNZ2QTT+tGs1oNj7ZUgAUgcvKwAba34=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=XzCIIBYuSy668KDJgC4CnPFxlGML1FOsxvcq5lNavEPGqiy1JcEXLnO8WUs7I5wla
	 LwA2vEo3Dq56p75gopJ+vswfJqfj0vric/hbgnE5mSPq9Rv6OFRStoVGE75wtQAKKA
	 sJUdnZKXBskcdP8BBNmmOZKF8HvbAbVBMrQAfyAw=
Received: from DLEE101.ent.ti.com (dlee101.ent.ti.com [157.170.170.31])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 30GH8UlO107718
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 16 Jan 2023 11:08:30 -0600
Received: from DLEE101.ent.ti.com (157.170.170.31) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Mon, 16
 Jan 2023 11:08:30 -0600
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE101.ent.ti.com
 (157.170.170.31) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Mon, 16 Jan 2023 11:08:30 -0600
Received: from [10.250.34.87] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 30GH8Ttu003053;
	Mon, 16 Jan 2023 11:08:29 -0600
Message-ID: <4ca62111-f173-ea41-7b9c-e6dc9182f69f@ti.com>
Date: Mon, 16 Jan 2023 11:08:29 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][PATCH 2/3] ti-k3-secdev: sets
 TI_K3_SECDEV_INSTALL_DIR_RECIPE default value
Content-Language: en-US
To: Jose Quaresma <quaresma.jose@gmail.com>, <meta-ti@lists.yoctoproject.org>
CC: <ricardo@foundries.io>, Jose Quaresma <jose.quaresma@foundries.io>
References: <20230116121626.885219-1-jose.quaresma@foundries.io>
 <20230116121626.885219-2-jose.quaresma@foundries.io>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230116121626.885219-2-jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 16 Jan 2023 17:08:38 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15571

On 1/16/23 6:16 AM, Jose Quaresma wrote:
> The TI_K3_SECDEV_INSTALL_DIR_RECIPE is defined on the meta-ti-extras layer
> so when the layer is not used the variable is undefined.
> For such cases we can use default value that is the same defined
> on the recipes-ti/includes/ti-paths.inc
> 
> Signed-off-by: Jose Quaresma <jose.quaresma@foundries.io>
> ---
>   meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb | 2 ++
>   1 file changed, 2 insertions(+)
> 
> diff --git a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> index fd3bd120..6a28add7 100644
> --- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> +++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
> @@ -4,6 +4,8 @@ SECTION = "devel"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
>   
> +# set a default value for TI_K3_SECDEV_INSTALL_DIR_RECIPE
> +export TI_K3_SECDEV_INSTALL_DIR_RECIPE = "${datadir}/ti/ti-k3-secdev"
>   include recipes-ti/includes/ti-paths.inc
>   

Using ti-paths.inc was not really right to begin with, I only did that as I was in a time
crunch, should be just removed (all of the file actually, but we can fix that later). Like
other -native tool recipes, the output should end up in a standard place that can be accessed
by recipes that depend on it. If -native packages could set env vars that would be nice, but
without that, lets just assume location and drop the include on ti-paths.inc.

For ti-k3-secdev_git.bb I'm thinking something like:


--- a/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
+++ b/meta-ti-bsp/recipes-ti/secdev/ti-k3-secdev_git.bb
@@ -4,8 +4,6 @@ SECTION = "devel"
  LICENSE = "BSD-3-Clause"
  LIC_FILES_CHKSUM = "file://manifest/k3-secdev-0.2-manifest.html;md5=f632a78870cc64550078d7b3cbac0892"
  
-require recipes-ti/includes/ti-paths.inc
-
  # Native host tool only
  COMPATIBLE_MACHINE = "null"
  COMPATIBLE_MACHINE:class-native = "(.*)"
@@ -23,11 +21,11 @@ S = "${WORKDIR}/git"
  
  do_install() {
      CP_ARGS="-Prf --preserve=mode,links,timestamps --no-preserve=ownership"
-    install -d ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
-    cp ${CP_ARGS} ${S}/* ${D}${TI_K3_SECDEV_INSTALL_DIR_RECIPE}
+    install -d ${D}${datadir}/ti/ti-k3-secdev
+    cp ${CP_ARGS} ${S}/* ${D}${datadir}/ti/ti-k3-secdev
  }
  
-FILES:${PN} += "${TI_K3_SECDEV_INSTALL_DIR_RECIPE}"
+FILES:${PN} += "${D}${datadir}/ti/ti-k3-secdev"
  
  INSANE_SKIP:${PN} = "arch ldflags file-rdeps"
  


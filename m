Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 499BDC83F2B
	for <webhook@archiver.kernel.org>; Thu, 31 Aug 2023 06:41:14 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web10.11029.1693464068821289230
 for <meta-ti@lists.yoctoproject.org>;
 Wed, 30 Aug 2023 23:41:09 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17Q1 header.b=n2mpE1+9;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 37V6f7N6121581;
	Thu, 31 Aug 2023 01:41:07 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1693464067;
	bh=E6cLEJSL4LotJqpXHX5R3K/0gHz8PlT7lUN0D4K0dzY=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=n2mpE1+9b12eFzqCsrd1TdwWNWwYYqICXlCs6HwHP3O9qXGYk60712COheNweumgo
	 u2e1WcLZvD3R7zUpB9xkfPh3wDAuryHrMoLanF9CTBvBF4yoZO5jNl3Kg4bp1bMePG
	 5zbwggAzpkC/3uVPlEK1Vy5waHoxThUdMy/+whns=
Received: from DLEE104.ent.ti.com (dlee104.ent.ti.com [157.170.170.34])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 37V6f7ZK029073
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 31 Aug 2023 01:41:07 -0500
Received: from DLEE113.ent.ti.com (157.170.170.24) by DLEE104.ent.ti.com
 (157.170.170.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 31
 Aug 2023 01:41:06 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 31 Aug 2023 01:41:06 -0500
Received: from [172.24.227.238] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 37V6f4RW076400;
	Thu, 31 Aug 2023 01:41:05 -0500
Content-Type: multipart/alternative;
	boundary="------------nc9xcx8RZty3Ed02u0OOCwb1"
Message-ID: <2d7c502a-a3a3-778e-4987-945dd74486d6@ti.com>
Date: Thu, 31 Aug 2023 12:11:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [EXTERNAL] [meta-ti][master/kirkstone][PATCH] k3conf: Update
 SRCREV and move to cmake
Content-Language: en-US
To: <reatmon@ti.com>, Praneeth Bajjuri <praneeth@ti.com>,
        Denys Dmytriyenko
	<denys@konsulko.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230830182054.21693-1-reatmon@ti.com>
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20230830182054.21693-1-reatmon@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 31 Aug 2023 06:41:14 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16912

--------------nc9xcx8RZty3Ed02u0OOCwb1
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit

Acked-by: Chirag Shilwant <c-shilwant@ti.com> <mailto:c-shilwant@ti.com>

On 30/08/23 23:50, Ryan Eatmon via lists.yoctoproject.org wrote:
> The SRCREV change corresponds to a commit that changes from make to
> cmake for building k3conf, so we need to update the recipe as well.
>
> Signed-off-by: Ryan Eatmon<reatmon@ti.com>
> ---
>   meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 12 +++---------
>   1 file changed, 3 insertions(+), 9 deletions(-)
>
> diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> index 2686810d..987055b0 100644
> --- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> +++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
> @@ -3,22 +3,16 @@ SUMMARY = "Diagnostic tool for TI K3 processors"
>   LICENSE = "BSD-3-Clause"
>   LIC_FILES_CHKSUM ="file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d"
>   
> +inherit cmake
> +
>   PV = "0.2+git${SRCPV}"
>   
>   COMPATIBLE_MACHINE = "k3"
>   
>   BRANCH ?= "master"
> -SRCREV = "81581afb405085755aea7744c1d196533e8094c4"
> +SRCREV = "859e1cc105a01a8a4a58318679f92e2135a03a99"
>   
>   SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
>   
>   S = "${WORKDIR}/git"
>   
> -do_compile () {
> -    oe_runmake CC="${CC}" CROSS_COMPILE=${TARGET_PREFIX} all
> -}
> -
> -do_install () {
> -    install -d ${D}${bindir}
> -    install ${S}/k3conf ${D}${bindir}
> -}
>
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#16909):https://lists.yoctoproject.org/g/meta-ti/message/16909
> Mute This Topic:https://lists.yoctoproject.org/mt/101058912/7030289
> Group Owner:meta-ti+owner@lists.yoctoproject.org
> Unsubscribe:https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy  [c-shilwant@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
>
--------------nc9xcx8RZty3Ed02u0OOCwb1
Content-Type: text/html; charset="UTF-8"
Content-Transfer-Encoding: 7bit

<html>
  <head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
  </head>
  <body>
    <p style="margin-top:14pt;margin-bottom:14pt;"><font
        face="monospace">Acked-by: Chirag Shilwant <a
          href="mailto:c-shilwant@ti.com" target="_blank" rel="noopener
          noreferrer">&lt;c-shilwant@ti.com&gt;</a></font></p>
    <p></p>
    <div class="moz-cite-prefix">On 30/08/23 23:50, Ryan Eatmon via
      lists.yoctoproject.org wrote:<br>
    </div>
    <blockquote type="cite"
      cite="mid:20230830182054.21693-1-reatmon@ti.com">
      <pre class="moz-quote-pre" wrap="">The SRCREV change corresponds to a commit that changes from make to
cmake for building k3conf, so we need to update the recipe as well.

Signed-off-by: Ryan Eatmon <a class="moz-txt-link-rfc2396E" href="mailto:reatmon@ti.com">&lt;reatmon@ti.com&gt;</a>
---
 meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb | 12 +++---------
 1 file changed, 3 insertions(+), 9 deletions(-)

diff --git a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
index 2686810d..987055b0 100644
--- a/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
+++ b/meta-ti-bsp/recipes-devtools/k3conf/k3conf_git.bb
@@ -3,22 +3,16 @@ SUMMARY = "Diagnostic tool for TI K3 processors"
 LICENSE = "BSD-3-Clause"
 LIC_FILES_CHKSUM = <a class="moz-txt-link-rfc2396E" href="file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d">"file://common/k3conf.c;beginline=1;endline=34;md5=7154c0ffcd418064ffa528e34e70ca9d"</a>
 
+inherit cmake
+
 PV = "0.2+git${SRCPV}"
 
 COMPATIBLE_MACHINE = "k3"
 
 BRANCH ?= "master"
-SRCREV = "81581afb405085755aea7744c1d196533e8094c4"
+SRCREV = "859e1cc105a01a8a4a58318679f92e2135a03a99"
 
 SRC_URI = "git://git.ti.com/git/k3conf/k3conf.git;protocol=https;branch=${BRANCH}"
 
 S = "${WORKDIR}/git"
 
-do_compile () {
-    oe_runmake CC="${CC}" CROSS_COMPILE=${TARGET_PREFIX} all
-}
-
-do_install () {
-    install -d ${D}${bindir}
-    install ${S}/k3conf ${D}${bindir}
-}
</pre>
      <br>
      <fieldset class="moz-mime-attachment-header"></fieldset>
      <pre class="moz-quote-pre" wrap="">
-=-=-=-=-=-=-=-=-=-=-=-
Links: You receive all messages sent to this group.
View/Reply Online (#16909): <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/message/16909">https://lists.yoctoproject.org/g/meta-ti/message/16909</a>
Mute This Topic: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/mt/101058912/7030289">https://lists.yoctoproject.org/mt/101058912/7030289</a>
Group Owner: <a class="moz-txt-link-abbreviated" href="mailto:meta-ti+owner@lists.yoctoproject.org">meta-ti+owner@lists.yoctoproject.org</a>
Unsubscribe: <a class="moz-txt-link-freetext" href="https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy">https://lists.yoctoproject.org/g/meta-ti/leave/11470056/7030289/1265141306/xyzzy</a> [<a class="moz-txt-link-abbreviated" href="mailto:c-shilwant@ti.com">c-shilwant@ti.com</a>]
-=-=-=-=-=-=-=-=-=-=-=-

</pre>
    </blockquote>
  </body>
</html>

--------------nc9xcx8RZty3Ed02u0OOCwb1--


Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6E3E2E7716A
	for <webhook@archiver.kernel.org>; Sat, 14 Dec 2024 16:51:35 +0000 (UTC)
Received: from fllvem-ot04.ext.ti.com (fllvem-ot04.ext.ti.com [198.47.19.246])
 by mx.groups.io with SMTP id smtpd.web11.20799.1734195091808479925
 for <meta-ti@lists.yoctoproject.org>;
 Sat, 14 Dec 2024 08:51:32 -0800
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=v7J1VXIi;
 spf=pass (domain: ti.com, ip: 198.47.19.246, mailfrom: c-shilwant@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by fllvem-ot04.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 4BEGpRAV3239320
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Sat, 14 Dec 2024 10:51:27 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1734195087;
	bh=4vmuzEymO1zEANK3k0CoNnSGVL2mmRib+pPfjbo6ukM=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=v7J1VXIiezgJHAib/e9rSWI/0HSGS3RJkwcB0um/+nnAQg4Xo91GMqre+dEPGfL3n
	 tFpj4Sz6gEjOzm0qNtw7CoN6wlw1/4MtVzlN97ldz9I9Bh68sRnUpMcrGhvl8I8uxO
	 EdEFdKmLpY/PmvNj17UsoeXKkNWyaUEOqQBEfzjI=
Received: from DLEE112.ent.ti.com (dlee112.ent.ti.com [157.170.170.23])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 4BEGpRqH029281
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Sat, 14 Dec 2024 10:51:27 -0600
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE112.ent.ti.com
 (157.170.170.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Sat, 14
 Dec 2024 10:51:27 -0600
Received: from lelvsmtp6.itg.ti.com (10.180.75.249) by DLEE109.ent.ti.com
 (157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Sat, 14 Dec 2024 10:51:27 -0600
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp6.itg.ti.com (8.15.2/8.15.2) with ESMTP id 4BEGpP9V016942;
	Sat, 14 Dec 2024 10:51:26 -0600
Message-ID: <72d10229-7bb1-4a1a-a1bd-9c8a1e45e77d@ti.com>
Date: Sat, 14 Dec 2024 22:21:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] [meta-ti] [master][PATCH 02/12] meta-beagle: create a
 separate layer for Beagle platforms
To: <meta-ti@lists.yoctoproject.org>
CC: Denys Dmytriyenko <denys@konsulko.com>,
        Denys Dmytriyenko
	<denis@denix.org>
References: <20241213233203.2688541-1-denis@denix.org>
 <20241213233203.2688541-2-denis@denix.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <20241213233203.2688541-2-denis@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllvem-ot04.ext.ti.com id 4BEGpRAV3239320
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Sat, 14 Dec 2024 16:51:35 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/18119

Hi,
On 14/12/24 05:01, Denys Dmytriyenko wrote:
> From: Denys Dmytriyenko <denys@=E2=80=8Akonsulko.=E2=80=8Acom> The new =
meta-beagle=20
> will host all supported Beagle platforms that use TI SoCs and hence=20
> need to depend on meta-ti-bsp. The default BSP for the platforms in=20
> this layer will use BeagleBoard.=E2=80=8Aorg
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe.
> Report=C2=A0Suspicious
> <https://us-phishalarm-ewt.proofpoint.com/EWT/v1/G3vK!ufdqXRfP9k1bCmYkX=
LPD3ATrhRc7Be5DbmTnaLnS8xxeYocqHQyCy2XTbJFbsgivVj4p5MY__7pc49O-GExEG28$>=20
>
> ZjQcmQRYFpfptBannerEnd
> From: Denys Dmytriyenko <denys@konsulko.com>
>
> The new meta-beagle will host all supported Beagle platforms that
> use TI SoCs and hence need to depend on meta-ti-bsp. The default
> BSP for the platforms in this layer will use BeagleBoard.org
> official trees for the Linux kernel and U-boot.
>
> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
> ---
> No changes since RFC v2
>
>   meta-beagle/COPYING.MIT     | 17 +++++++++++++++++
>   meta-beagle/README          | 31 +++++++++++++++++++++++++++++++
>   meta-beagle/conf/layer.conf | 15 +++++++++++++++
>   3 files changed, 63 insertions(+)
>   create mode 100644 meta-beagle/COPYING.MIT
>   create mode 100644 meta-beagle/README
>   create mode 100644 meta-beagle/conf/layer.conf
>
> diff --git a/meta-beagle/COPYING.MIT b/meta-beagle/COPYING.MIT
> new file mode 100644
> index 00000000..fb950dc6
> --- /dev/null
> +++ b/meta-beagle/COPYING.MIT
> @@ -0,0 +1,17 @@
> +Permission is hereby granted, free of charge, to any person obtaining =
a copy
> +of this software and associated documentation files (the "Software"), =
to deal
> +in the Software without restriction, including without limitation the =
rights
> +to use, copy, modify, merge, publish, distribute, sublicense, and/or s=
ell
> +copies of the Software, and to permit persons to whom the Software is
> +furnished to do so, subject to the following conditions:
> +
> +The above copyright notice and this permission notice shall be include=
d in
> +all copies or substantial portions of the Software.
> +
> +THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRES=
S OR
> +IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILIT=
Y,
> +FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHAL=
L THE
> +AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
> +LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISIN=
G FROM,
> +OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS=
 IN
> +THE SOFTWARE.
> diff --git a/meta-beagle/README b/meta-beagle/README
> new file mode 100644
> index 00000000..a17e6433
> --- /dev/null
> +++ b/meta-beagle/README
> @@ -0,0 +1,31 @@
> +OpenEmbedded/Yocto layer that extends meta-ti-bsp with BeagleBoard.org=
 platforms.
> +
> +It is hosted onhttps://urldefense.com/v3/__http://git.yoctoproject.org=
/cgit/cgit.cgi/meta-ti/__;!!G3vK!RhFrAwBeZ-rhgX8UUzKDKFZWCjt8EgyDSOEvMH19=
rE9tSx7bNrv6nsj6btyl-t_sTzXbUOdQ0PkI$  with the
> +source repository at git://git.yoctoproject.org/meta-ti
> +
> +
> +This layer depends on:
> +
> +URI: git://git.openembedded.org/openembedded-core
> +layers: meta
> +branch: master
> +
> +URI: git://git.yoctoproject.org/meta-arm
> +layers: meta-arm
> +branch: master
> +
> +URI: git://git.yoctoproject.org/meta-ti
> +branch: master
> +revision: HEAD
> +layers: meta-ti-bsp
> +
> +
> +Send pull requests, patches, comments or questions to:
> +meta-ti@lists.yoctoproject.org
> +
> +Please note - meta-ti mailing list requires subscription for posting:
> +https://urldefense.com/v3/__https://lists.yoctoproject.org/g/meta-ti__=
;!!G3vK!RhFrAwBeZ-rhgX8UUzKDKFZWCjt8EgyDSOEvMH19rE9tSx7bNrv6nsj6btyl-t_sT=
zXbUJK9gxQT$
> +
> +Maintainers:
> +Denys Dmytriyenko <denys@konsulko.com>
> +Ryan Eatmon <reatmon@ti.com>
> diff --git a/meta-beagle/conf/layer.conf b/meta-beagle/conf/layer.conf
> new file mode 100644
> index 00000000..df6a77ed
> --- /dev/null
> +++ b/meta-beagle/conf/layer.conf
> @@ -0,0 +1,15 @@
> +# We have a conf and classes directory, append to BBPATH
> +BBPATH .=3D ":${LAYERDIR}"
> +
> +# We have a recipes directory, add to BBFILES
> +BBFILES +=3D "${LAYERDIR}/recipes*/*/*.bb ${LAYERDIR}/recipes*/*/*.bba=
ppend"
> +
> +BBFILE_COLLECTIONS +=3D "meta-beagle"
> +BBFILE_PATTERN_meta-beagle :=3D "^${LAYERDIR}/"
> +BBFILE_PRIORITY_meta-beagle =3D "6"
> +
> +LAYERSERIES_COMPAT_meta-beagle =3D "scarthgap styhead walnascar"



Post [1], LAYERSERIES_COMPAT_meta-beagle shouldn't have scarthgap
in meta-ti:master since this sublayer has a hard dependency on=20
meta-ti-bsp via LAYERDEPENDS & meta-ti-bsp has dropped scarthgap
from LAYERSERIES_COMPAT in master


[1]:=20
https://git.yoctoproject.org/meta-ti/commit/?id=3D70c21b00dc9a095dbc11bb4=
0142703a8e9d01209

---
Chirag



> +
> +LAYERDEPENDS_meta-beagle =3D " \
> +    meta-ti-bsp \
> +"
> --=20
> 2.25.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#18110): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/18110__;!!G3vK!RhFrAwBeZ-rhgX8UUzKDKFZW=
Cjt8EgyDSOEvMH19rE9tSx7bNrv6nsj6btyl-t_sTzXbUCVDLogc$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/110107251/7030289__;!!G3vK!RhFrAwBeZ-rhgX8UUzKDKFZWCjt8EgyDSOEvMH=
19rE9tSx7bNrv6nsj6btyl-t_sTzXbUPUANrXt$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!RhFrAwBeZ-rhgX8UUzKDKFZWCjt8EgyDSOEvMH19rE9tSx7=
bNrv6nsj6btyl-t_sTzXbUF5PWjrl$  [c-shilwant@ti.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


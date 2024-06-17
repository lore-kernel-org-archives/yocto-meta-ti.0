Return-Path: <c-shilwant@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7094C27C6E
	for <webhook@archiver.kernel.org>; Mon, 17 Jun 2024 08:36:33 +0000 (UTC)
Received: from fllv0015.ext.ti.com (fllv0015.ext.ti.com [198.47.19.141])
 by mx.groups.io with SMTP id smtpd.web11.51529.1718613389656566593
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 17 Jun 2024 01:36:29 -0700
Authentication-Results: mx.groups.io;
 dkim=fail reason="dkim: body hash did not verify" header.i=@ti.com header.s=ti-com-17Q1 header.b=bqz0Jalx;
 spf=pass (domain: ti.com, ip: 198.47.19.141, mailfrom: c-shilwant@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 45H8aQFb028946;
	Mon, 17 Jun 2024 03:36:26 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1718613386;
	bh=puoLTIj5u5iouR3s5P2/85CUhJ72D3vE083MTgxpYwo=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=bqz0JalxyWdEEz/4tU0eDr5HtSmPZfcaXodiQqUYhg2NfngxtU+tacD/oAKM/2vzF
	 to8HXNFnXF9/LTYyHip63yLT8d5514shX9efBNhrPTbbexCiXoABtzaNJ+jAz2uYHy
	 IaqmdZ2EP9zm27QD9JiCAsJcli3z7f2lliQqJfh0=
Received: from DFLE107.ent.ti.com (dfle107.ent.ti.com [10.64.6.28])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 45H8aQvC110323
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Mon, 17 Jun 2024 03:36:26 -0500
Received: from DFLE100.ent.ti.com (10.64.6.21) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Mon, 17
 Jun 2024 03:36:26 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Mon, 17 Jun 2024 03:36:26 -0500
Received: from [172.24.227.238] (chirag-hp-z2-tower-g5-workstation.dhcp.ti.com [172.24.227.238])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 45H8aO2W079863;
	Mon, 17 Jun 2024 03:36:25 -0500
Message-ID: <2198dfee-7862-40ed-81d5-12a9b1a63882@ti.com>
Date: Mon, 17 Jun 2024 14:06:24 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [EXTERNAL] Re: [meta-ti][master/scarthgap][PATCH] conf: machine:
 Update UBOOT_MACHINE for am62xxsip-evm
To: Ryan Eatmon <reatmon@ti.com>
CC: <meta-ti@lists.yoctoproject.org>, Gyan Gupta <g-gupta@ti.com>,
        Denys
 Dmytriyenko <denis@denix.org>
References: <20240614070123.1155319-1-c-shilwant@ti.com>
 <20240614164146.GZ21287@denix.org>
 <17D9BD3E479652A1.27929@lists.yoctoproject.org>
Content-Language: en-US
From: Chirag Shilwant <c-shilwant@ti.com>
In-Reply-To: <17D9BD3E479652A1.27929@lists.yoctoproject.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Content-Transfer-Encoding: quoted-printable
X-MIME-Autoconverted: from 8bit to quoted-printable by fllv0015.ext.ti.com id 45H8aQFb028946
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 17 Jun 2024 08:36:33 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/17751

Hi Ryan,

Sent a patch that can be applied on top of master-next & scarthgap-next=20
- https://lists.yoctoproject.org/g/meta-ti/message/17750

On 17/06/24 13:56, Chirag Shilwant via lists.yoctoproject.org wrote:
> Hi Denys, On 14/06/24 22:=E2=80=8A11, Denys Dmytriyenko wrote: > On Fri=
, Jun=20
> 14, 2024 at 12:=E2=80=8A31:=E2=80=8A23PM +0530, Chirag Shilwant via=20
> lists.=E2=80=8Ayoctoproject.=E2=80=8Aorg wrote: >> Modify the U-Boot de=
fconfig names=20
> for A53 and R5 >> machine configurations
> ZjQcmQRYFpfptBannerStart
> This message was sent from outside of Texas Instruments.
> Do not click links or open attachments unless you recognize the source=20
> of this email and know the content is safe. If you wish to report this=20
> message to IT Security, please forward the message as an attachment to=20
> phishing@list.ti.com
> ZjQcmQRYFpfptBannerEnd
> Hi Denys,
>
> On 14/06/24 22:11, Denys Dmytriyenko wrote:
> > On Fri, Jun 14, 2024 at 12:31:23PM +0530, Chirag Shilwant via lists.y=
octoproject.org wrote:
> >> Modify the U-Boot defconfig names for A53 and R5
> >> machine configurations based on ti-u-boot-2024.04 [1]
> >>
> >> [1]: https://git.ti.com/cgit/ti-u-boot/ti-u-boot/commit/?h=3Dti-u-bo=
ot-2024.04&id=3Ddf5181f8c6c41bf018ec043d565581b5d8a291c5
> > If we get the multi-BSP support merged, this would have to be adjuste=
d to NOT
> > break builds with 2023.04 U-boot...
> >
> > Similar to beagleplay and beaglebone-ai64 changes here:
> > https://urldefense.com/v3/__https://patchwork.yoctoproject.org/projec=
t/ti/patch/20240613172254.770920-3-denis@denix.org/__;!!G3vK!U3V_n7wJdfwn=
X6P_T7k51a23o2sLC9dcUlZx06kX-HdJfreBml0PSj_uDPTUdTzudDdlTSeZ87mqvXNFd2pcR=
eiQqnqpSzJBAz8q$
>
>
>
> Thanks Denys for the catch! I will send out a new patch on top of
> meta-ti "-next" branch to handle 2023.04 U-boot.
> FYI, we can't handle u-boot-ti-mainline which is on 2024.01 [1], as it
> doesn't seem to have a fragment
> similar to 2023.04 U-boot nor it has the latest am62xsip* def-configs
> [2]. Hence, I will send out
> a patch only to support ti-u-boot-2023.04
>
> [1]:
> https://git.ti.com/cgit/arago-project/meta-ti/tree/meta-ti-bsp/recipes-=
bsp/u-boot/u-boot-ti-mainline_git.bb#n16
>
> [2]:
> https://urldefense.com/v3/__https://source.denx.de/u-boot/u-boot/-/tree=
/866ca972d6c3cabeaf6dbac431e8e08bb30b3c8e/configs__;!!G3vK!U3V_n7wJdfwnX6=
P_T7k51a23o2sLC9dcUlZx06kX-HdJfreBml0PSj_uDPTUdTzudDdlTSeZ87mqvXNFd2pcRei=
QqnqpSxPFUFeQ$
>
>
>
> >
> >
> >> Signed-off-by: Chirag Shilwant <c-shilwant@ti.com>
> >> ---
> >>   meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf | 7 +------
> >>   meta-ti-bsp/conf/machine/am62xxsip-evm.conf      | 2 +-
> >>   2 files changed, 2 insertions(+), 7 deletions(-)
> >>
> >> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf b/meta=
-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >> index 0daff2b9..c35edc6e 100644
> >> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm-k3r5.conf
> >> @@ -8,9 +8,4 @@ SYSFW_SOC =3D "am62x"
> >>   SYSFW_CONFIG =3D "evm"
> >>   SYSFW_SUFFIX =3D "hs-fs"
> >>  =20
> >> -UBOOT_MACHINE =3D "am62x_evm_r5_defconfig"
> >> -
> >> -# UBOOT_CONFIG_FRAGMENTS holds the list of u-boot config fragments =
which has to be build
> >> -# along with the base defconfig mentioned in UBOOT_MACHINE. Refer u=
-boot-mergeconfig.inc
> >> -# under meta-ti-bsp/recipes-bsp/u-boot/ for more details.
> >> -UBOOT_CONFIG_FRAGMENTS =3D "am62xsip_sk_r5.config"
> >> +UBOOT_MACHINE =3D "am62xsip_evm_r5_defconfig"
> >> diff --git a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf b/meta-ti-b=
sp/conf/machine/am62xxsip-evm.conf
> >> index b5dd18f1..38fe04c9 100644
> >> --- a/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> >> +++ b/meta-ti-bsp/conf/machine/am62xxsip-evm.conf
> >> @@ -13,4 +13,4 @@ KERNEL_DEVICETREE =3D " \
> >>       ti/k3-am625-sk.dtb \
> >>   "
> >>  =20
> >> -UBOOT_MACHINE =3D "am62x_evm_a53_defconfig"
> >> +UBOOT_MACHINE =3D "am62xsip_evm_a53_defconfig"
> >> --=20
> >> 2.34.1
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#17749): https://urldefense.com/v3/__https://lists.y=
octoproject.org/g/meta-ti/message/17749__;!!G3vK!U3V_n7wJdfwnX6P_T7k51a23=
o2sLC9dcUlZx06kX-HdJfreBml0PSj_uDPTUdTzudDdlTSeZ87mqvXNFd2pcReiQqnqpSxuP5=
1UT$
> Mute This Topic: https://urldefense.com/v3/__https://lists.yoctoproject=
.org/mt/106666223/7030289__;!!G3vK!U3V_n7wJdfwnX6P_T7k51a23o2sLC9dcUlZx06=
kX-HdJfreBml0PSj_uDPTUdTzudDdlTSeZ87mqvXNFd2pcReiQqnqpS3xiea-z$
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://urldefense.com/v3/__https://lists.yoctoproject.org=
/g/meta-ti/unsub__;!!G3vK!U3V_n7wJdfwnX6P_T7k51a23o2sLC9dcUlZx06kX-HdJfre=
Bml0PSj_uDPTUdTzudDdlTSeZ87mqvXNFd2pcReiQqnqpS-jfrB8R$  [c-shilwant@ti.co=
m]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


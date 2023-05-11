Return-Path: <reatmon@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C1ABC77B7F
	for <webhook@archiver.kernel.org>; Thu, 11 May 2023 19:51:08 +0000 (UTC)
Received: from lelv0143.ext.ti.com (lelv0143.ext.ti.com [198.47.23.248])
 by mx.groups.io with SMTP id smtpd.web11.6653.1683834665596918292
 for <meta-ti@lists.yoctoproject.org>;
 Thu, 11 May 2023 12:51:05 -0700
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=rkEL3HPl;
 spf=pass (domain: ti.com, ip: 198.47.23.248, mailfrom: reatmon@ti.com)
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelv0143.ext.ti.com (8.15.2/8.15.2) with ESMTP id 34BJp2vP001049;
	Thu, 11 May 2023 14:51:02 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1683834662;
	bh=2akWmu9CvaP8/Z5rpyuO528BPY69cdtIJho4moko7Co=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=rkEL3HPljKZ+lagQgvIfrZmpZjWV5t4qKP2SDspHHm7ztwEZFzdFbn7Vl+sFZyaL6
	 rMLhxuLijhfJuxIzIF5CanO478ku6N4IdUkST2IbJLD9wmgkM/QLAIFudwNqA9dcXT
	 HcDTYNpJxRT0DDZDAfpSiwKlyWcLwAhB66Y1mpJk=
Received: from DLEE107.ent.ti.com (dlee107.ent.ti.com [157.170.170.37])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 34BJp2ZX074699
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Thu, 11 May 2023 14:51:02 -0500
Received: from DLEE107.ent.ti.com (157.170.170.37) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Thu, 11
 May 2023 14:51:02 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DLEE107.ent.ti.com
 (157.170.170.37) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Thu, 11 May 2023 14:51:02 -0500
Received: from [128.247.81.69] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 34BJp1Zh021786;
	Thu, 11 May 2023 14:51:01 -0500
Message-ID: <8a94fa5f-7dd7-e7d2-f0b1-257b6d7f1f27@ti.com>
Date: Thu, 11 May 2023 14:51:01 -0500
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [meta-ti] [master/kirkstone][PATCH 2/2] trusted-firmware-a: only
 activate customizations for TI platforms
To: Denys Dmytriyenko <denis@denix.org>
CC: <meta-ti@lists.yoctoproject.org>, Denys Dmytriyenko <denys@konsulko.com>
References: <20230511184301.1075335-1-denis@denix.org>
 <20230511184301.1075335-2-denis@denix.org>
 <9470a393-2241-bf48-41cf-77d14ec79ae7@ti.com>
 <20230511194954.GC9226@denix.org>
From: Ryan Eatmon <reatmon@ti.com>
In-Reply-To: <20230511194954.GC9226@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Thu, 11 May 2023 19:51:08 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/16523


Already done.  No worries.


On 5/11/2023 2:49 PM, Denys Dmytriyenko wrote:
> Sorry about all that - I can resend everything specifically for kirkstone
> 
> On Thu, May 11, 2023 at 02:46:11PM -0500, Ryan Eatmon via lists.yoctoproject.org wrote:
>>
>> This does not apply against kirkstone cleanly because of a patch
>> applied to the master recipe that is not in kirkstone.  I'll fix it
>> as I apply the patch, but I wanted to inform anyone trying it
>> themselves.
>>
>>
>> On 5/11/2023 1:43 PM, Denys Dmytriyenko wrote:
>>> From: Denys Dmytriyenko <denys@konsulko.com>
>>>
>>> Avoid inheriting ti-secdev class and adding unconditional dependency
>>> on TI_SECURE_DEV_PKG and other variables, when meta-ti-bsp is in the
>>> bblayers.conf stack, but not building for TI platforms. This solves
>>> yocto-check-layer signature test for Yocto Project compliance.
>>>
>>> Signed-off-by: Denys Dmytriyenko <denys@konsulko.com>
>>> ---
>>>   ...a_%.bbappend => trusted-firmware-a-ti.inc} |  0
>>>   .../trusted-firmware-a_%.bbappend             | 72 +------------------
>>>   2 files changed, 3 insertions(+), 69 deletions(-)
>>>   copy meta-ti-bsp/recipes-bsp/trusted-firmware-a/{trusted-firmware-a_%.bbappend => trusted-firmware-a-ti.inc} (100%)
>>>
>>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> similarity index 100%
>>> copy from meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>> copy to meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a-ti.inc
>>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>> index 4ea63205..00d08a51 100644
>>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>>> @@ -1,70 +1,4 @@
>>> -PV:k3 = "2.8+git${SRCPV}"
>>> -SRCREV_tfa:k3 = "2fcd408bb3a6756767a43c073c597cef06e7f2d5"
>>> -SRC_URI:k3 = "git://git.trustedfirmware.org/TF-A/trusted-firmware-a.git;protocol=https;name=tfa;branch=master"
>>> -COMPATIBLE_MACHINE:k3 = "k3"
>>> -TFA_BUILD_TARGET:k3 = "all"
>>> -TFA_INSTALL_TARGET:k3 = "bl31"
>>> -TFA_SPD:k3 = "opteed"
>>> +TFA_TI = ""
>>> +TFA_TI:k3 = "trusted-firmware-a-ti.inc"
>>> -SRC_URI:append:k3 = " file://rwx-segments-ti.patch"
>>> -FILESEXTRAPATHS:prepend := "${THISDIR}/files:"
>>> -
>>> -# Use TI SECDEV for signing
>>> -inherit ti-secdev
>>> -
>>> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>>> -EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>>> -
>>> -# Signing procedure for K3 HS devices
>>> -tfa_sign_k3hs() {
>>> -	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
>>> -	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
>>> -}
>>> -
>>> -do_compile:append:am65xx-hs-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:am64xx-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:am62xx-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:am62xx-lp-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:am62axx-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:j721e-hs-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:j7200-hs-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:j721s2-hs-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_compile:append:j784s4-hs-evm() {
>>> -    tfa_sign_k3hs
>>> -}
>>> -
>>> -do_install:append:k3() {
>>> -    if [ -f ${BUILD_DIR}/bl31.bin.unsigned ]; then
>>> -        echo "Install bl31.bin.unsigned"
>>> -        install -m 0644 ${BUILD_DIR}/bl31.bin.unsigned \
>>> -        ${D}/firmware/bl31.bin.unsigned
>>> -    else
>>> -        echo "Install bl31.bin.unsigned"
>>> -        install -m 0644 ${BUILD_DIR}/bl31.bin \
>>> -        ${D}/firmware/bl31.bin.unsigned
>>> -    fi
>>> -}
>>> +require ${TFA_TI}
>>>
>>>
>>>
>>>
>>>
>>
>> -- 
>> Ryan Eatmon                reatmon@ti.com
>> -----------------------------------------
>> Texas Instruments, Inc.  -  LCPD  -  MGTS
> 
>>
>> -=-=-=-=-=-=-=-=-=-=-=-
>> Links: You receive all messages sent to this group.
>> View/Reply Online (#16521): https://lists.yoctoproject.org/g/meta-ti/message/16521
>> Mute This Topic: https://lists.yoctoproject.org/mt/98834090/3617104
>> Group Owner: meta-ti+owner@lists.yoctoproject.org
>> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/leave/6695352/3617104/1311934448/xyzzy [denis@denix.org]
>> -=-=-=-=-=-=-=-=-=-=-=-
>>
> 
> 

-- 
Ryan Eatmon                reatmon@ti.com
-----------------------------------------
Texas Instruments, Inc.  -  LCPD  -  MGTS


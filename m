Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A0B73C636D4
	for <webhook@archiver.kernel.org>; Fri, 10 Feb 2023 18:56:34 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.2632.1676055385269903006
 for <meta-ti@lists.yoctoproject.org>;
 Fri, 10 Feb 2023 10:56:25 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=FwnRlUHi;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0035.itg.ti.com ([10.64.41.0])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 31AIuL2J084817;
	Fri, 10 Feb 2023 12:56:21 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1676055381;
	bh=rYWED0GWIVo1UWgWcWj1wBFof1b9soV6g9rkPkkkDng=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=FwnRlUHi8Hlgyi762q7Nbq1zIgN005TGMIyTTVskpDmMgTTTrAeRkspHqXUfXcQgW
	 6zPj2m6zQU3FoN3RgtgHU9ZnjMNpy6ApXZ0IV7UbqcrUyXJznpZMcljVpFb1RDERSR
	 m3ZIzUqbhwYlqaKvbKszgmjPVkEUXWyEO7BtZVXU=
Received: from DFLE100.ent.ti.com (dfle100.ent.ti.com [10.64.6.21])
	by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 31AIuLDV005820
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Fri, 10 Feb 2023 12:56:21 -0600
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE100.ent.ti.com
 (10.64.6.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Fri, 10
 Feb 2023 12:56:20 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
 (10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Fri, 10 Feb 2023 12:56:20 -0600
Received: from [10.250.33.40] (ileaxei01-snat.itg.ti.com [10.180.69.5])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 31AIuKnA001477;
	Fri, 10 Feb 2023 12:56:20 -0600
Message-ID: <23124d98-58b3-1cfa-7f3d-8c286638d099@ti.com>
Date: Fri, 10 Feb 2023 12:56:20 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti][master/kirkstone][PATCH 1/4] trusted-firmware-a: Use
 ti-k3-secdev if TI_SECURE_DEV_PKG_K3 is not defined
Content-Language: en-US
To: Denys Dmytriyenko <denis@denix.org>
CC: Denys Dmytriyenko <denys@konsulko.com>, Ryan Eatmon <reatmon@ti.com>,
        <meta-ti@lists.yoctoproject.org>
References: <20230208231031.16363-1-afd@ti.com>
 <20230210185139.GW22689@denix.org>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230210185139.GW22689@denix.org>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Fri, 10 Feb 2023 18:56:34 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15799

On 2/10/23 12:51 PM, Denys Dmytriyenko wrote:
> On Wed, Feb 08, 2023 at 05:10:28PM -0600, Andrew Davis via lists.yoctoproject.org wrote:
>> Use the new ti-k3-secdev package to pull in the signing tools if they are
>> not provided by the environment. This allows us to use these tools
>> unconditionally. Remove the checks for the script and do the signing
>> for all K3 machines. The signature is automatically stripped from
>> the binaries on non-HS devices at boot time as needed so this change
>> is harmless for GP devices.
>>
>> Signed-off-by: Andrew Davis <afd@ti.com>
>> ---
>>   .../trusted-firmware-a_%.bbappend             | 43 ++++++-------------
>>   1 file changed, 12 insertions(+), 31 deletions(-)
>>
>> diff --git a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> index 5acc5c2e..95f1d2d9 100644
>> --- a/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> +++ b/meta-ti-bsp/recipes-bsp/trusted-firmware-a/trusted-firmware-a_%.bbappend
>> @@ -6,39 +6,20 @@ TFA_BUILD_TARGET:k3 = "all"
>>   TFA_INSTALL_TARGET:k3 = "bl31"
>>   TFA_SPD:k3 = "opteed"
>>   
>> +# Use default package TI SECDEV is one is not provided
> 
> typo - *if* one is not provided
> 

Good catch

> 
>> +DEPENDS:append:k3 = "${@ '' if d.getVar('TI_SECURE_DEV_PKG_K3') else ' ti-k3-secdev-native' }"
>> +
>> +# Set a default value for TI_K3_SECDEV_INSTALL_DIR
>> +export TI_K3_SECDEV_INSTALL_DIR = "${STAGING_DIR_NATIVE}${datadir}/ti/ti-k3-secdev"
>> +include recipes-ti/includes/ti-paths.inc
> 
> If you set TI_K3_SECDEV_INSTALL_DIR explicitly, why do you need to include
> ti-paths.inc here?
> 

ti-paths.inc is part of meta-ti-extras which might not be included in one's layer stack.
If not, this is a sane default, but ti-paths.inc can still override that path if available.

Andrew

> 
>> +TI_SECURE_DEV_PKG:k3 = "${@ d.getVar('TI_SECURE_DEV_PKG_K3') or d.getVar('TI_K3_SECDEV_INSTALL_DIR') }"
>> +
>>   EXTRA_OEMAKE:append:k3 = "${@ ' K3_USART=' + d.getVar('TFA_K3_USART') if d.getVar('TFA_K3_USART') else ''}"
>>   EXTRA_OEMAKE:append:k3 = "${@ ' K3_PM_SYSTEM_SUSPEND=' + d.getVar('TFA_K3_SYSTEM_SUSPEND') if d.getVar('TFA_K3_SYSTEM_SUSPEND') else ''}"
>>   
>> -# Signing procedure for K3 HS devices
>> -tfa_sign_k3hs() {
>> +# Signing procedure for K3 devices
>> +do_compile:append:k3() {
>>   	export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>> -	( cd ${BUILD_DIR}; \
>> -		mv bl31.bin bl31.bin.unsigned; \
>> -		if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
>> -			${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh bl31.bin.unsigned bl31.bin; \
>> -		else \
>> -			echo "Warning: TI_SECURE_DEV_PKG not set, TF-A not signed."; \
>> -			cp bl31.bin.unsigned bl31.bin; \
>> -		fi; \
>> -	)
>> -}
>> -
>> -do_compile:append:am65xx-hs-evm() {
>> -	tfa_sign_k3hs
>> -}
>> -
>> -do_compile:append:am64xx-evm() {
>> -	tfa_sign_k3hs
>> -}
>> -
>> -do_compile:append:j721e-hs-evm() {
>> -	tfa_sign_k3hs
>> -}
>> -
>> -do_compile:append:j7200-hs-evm() {
>> -	tfa_sign_k3hs
>> -}
>> -
>> -do_compile:append:j721s2-hs-evm() {
>> -	tfa_sign_k3hs
>> +	mv ${BUILD_DIR}/bl31.bin ${BUILD_DIR}/bl31.bin.unsigned
>> +	${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${BUILD_DIR}/bl31.bin.unsigned ${BUILD_DIR}/bl31.bin
>>   }
>> -- 
>> 2.39.1


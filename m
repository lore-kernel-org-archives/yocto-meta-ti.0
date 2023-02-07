Return-Path: <afd@ti.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 93712C636CC
	for <webhook@archiver.kernel.org>; Tue,  7 Feb 2023 23:44:45 +0000 (UTC)
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
 by mx.groups.io with SMTP id smtpd.web10.6689.1675813482722042780
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 07 Feb 2023 15:44:42 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@ti.com header.s=ti-com-17q1 header.b=yszQyzNy;
 spf=pass (domain: ti.com, ip: 198.47.23.249, mailfrom: afd@ti.com)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id 317NieKH008944;
	Tue, 7 Feb 2023 17:44:40 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1675813480;
	bh=HrukU00ecZZwFLdA2MsOXj7Ejjx5H8FZTlXxBaSSaO0=;
	h=Date:Subject:To:References:From:In-Reply-To;
	b=yszQyzNyxkkMo4sWdBOa5YUoGkM3QOS4wD6U4m8oVq35pjFNm3jCY3/pmpPzIk+qA
	 Ae1vwiJOzJ76JEk/k2nlsaMjw1vYEUsPTYphR3TsLU2AQ2yPGHbBlkE65HlgdNYNqZ
	 5jGelHUoO35+dzuvyAApLWjwcojjF5RDb2+ziKgs=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 317NierP015777
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Tue, 7 Feb 2023 17:44:40 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16; Tue, 7
 Feb 2023 17:44:39 -0600
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE101.ent.ti.com
 (10.64.6.22) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.16 via
 Frontend Transport; Tue, 7 Feb 2023 17:44:39 -0600
Received: from [10.249.37.35] (ileaxei01-snat2.itg.ti.com [10.180.69.6])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 317NidHC027820;
	Tue, 7 Feb 2023 17:44:39 -0600
Message-ID: <d68053d1-66e3-e582-a8f8-1dddc597fe6c@ti.com>
Date: Tue, 7 Feb 2023 17:44:39 -0600
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.2
Subject: Re: [meta-ti] [dunfell] ti-rtos-firmware: Check if TI_SECURE_DEV is
 set before signing
Content-Language: en-US
To: Wadim Egorov <w.egorov@phytec.de>, <upstream@lists.phytec.de>,
        <meta-ti@lists.yoctoproject.org>
References: <20230201143126.3003913-1-w.egorov@phytec.de>
From: Andrew Davis <afd@ti.com>
In-Reply-To: <20230201143126.3003913-1-w.egorov@phytec.de>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Tue, 07 Feb 2023 23:44:45 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15749

On 2/1/23 8:31 AM, Wadim Egorov wrote:
> Check if ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh is set
> before signing firmware for am62xx based machines. Otherwise do not
> sign, instead copy the binary and warn about it.
> 
> Fixes
>    run.do_install: 111: /scripts/secure-binary-image.sh: not found
> 
> Signed-off-by: Wadim Egorov <w.egorov@phytec.de>
> ---

This patch only fixes this for AM62x, a better way might be to use
the ti-k3-secdev-native package to get the signing tool when it is
not defined. I do that in the series for Kirkstone that includes
several fixes to this recipe[0].

Andrew

[0] https://lists.yoctoproject.org/g/meta-ti/topic/master_kirkstone_patch_1_8/96819771

>   recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb | 17 ++++++++++++++---
>   1 file changed, 14 insertions(+), 3 deletions(-)
> 
> diff --git a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> index 72d85a6b..66c6a4e4 100644
> --- a/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> +++ b/recipes-ti/ti-rtos-bin/ti-rtos-firmware.bb
> @@ -179,12 +179,23 @@ do_install_prepend_am62xx() {
>           export TI_SECURE_DEV_PKG=${TI_SECURE_DEV_PKG}
>           ( cd ${RTOS_DM_FW_DIR}; \
>                   mv ${DM_FIRMWARE} ${DM_FIRMWARE}.unsigned; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +                if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
> +                    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +                else \
> +                    echo "Warning: TI_SECURE_DEV_PKG not set, ${DM_FIRMWARE} not signed."; \
> +                    cp ${DM_FIRMWARE}.unsigned ${DM_FIRMWARE}; \
> +                fi; \
>           )
>           ( cd ${RTOS_IPC_FW_DIR}; \
>                   mv am62-mcu-m4f0_0-fw ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f; \
> -                ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
> -                    ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
> +
> +                if [ -f ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ]; then \
> +                    ${TI_SECURE_DEV_PKG}/scripts/secure-binary-image.sh ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f \
> +                        ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
> +                else \
> +                    echo "Warning: TI_SECURE_DEV_PKG not set, ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f not signed"; \
> +                    cp ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f ipc_echo_baremetal_test_mcu2_0_release_strip.xer5f.signed; \
> +                fi; \
>           )
>   }
>   
> 
> 
> 
> -=-=-=-=-=-=-=-=-=-=-=-
> Links: You receive all messages sent to this group.
> View/Reply Online (#15718): https://lists.yoctoproject.org/g/meta-ti/message/15718
> Mute This Topic: https://lists.yoctoproject.org/mt/96677334/3619733
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [afd@ti.com]
> -=-=-=-=-=-=-=-=-=-=-=-
> 


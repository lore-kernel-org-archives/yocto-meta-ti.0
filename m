Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id A18E3E00D8A; Wed, 25 Sep 2019 06:33:25 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 64C7DE00D60
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2019 06:33:24 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x8PDXNAq096135
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2019 08:33:23 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1569418403;
	bh=0Nr5/aejhrX1t7jIbLnFTujqpUAZVQNNk8FvaQR8oiI=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=ajnlCBbYIeCzXWAamNPgqM9hyUGd/QvMOzmsAm8NdVYTdIjIlPwyaIUKmIXQHw72R
	AhCNnZAHQBdkdq7fLCMx0MNbnerRnc7h1E/9yxMmE3am1I7jXbCoKe6y73BhxcxhIf
	RkxPmUZd1RhPYV7AETHKGmrkg857I1iSCddmgvtc=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x8PDXNwk081644
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Wed, 25 Sep 2019 08:33:23 -0500
Received: from DLEE109.ent.ti.com (157.170.170.41) by DLEE113.ent.ti.com
	(157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Wed, 25 Sep 2019 08:33:16 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DLEE109.ent.ti.com
	(157.170.170.41) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Wed, 25 Sep 2019 08:33:16 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id x8PDXNUp054305;
	Wed, 25 Sep 2019 08:33:23 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1569208572-22592-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <a98fc88e-a76a-da01-6141-e7ac553a192d@ti.com>
Date: Wed, 25 Sep 2019 09:33:23 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1569208572-22592-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH v3] ti-ipc: Update to new version 3.50.04.07
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Usage and development list for the meta-ti layer
	<meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Wed, 25 Sep 2019 13:33:25 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport this to ti2019.03.


Thank you,

Jake

On 9/22/2019 11:16 PM, Sam Nelson wrote:
> Signed-off-by: Sam Nelson <sam.nelson@ti.com>
>
> ---
> Change from previous version of patch
> - Updated ipc-examples commit id
> ---
> ---
>   recipes-ti/ipc/ti-ipc-common.inc | 2 +-
>   recipes-ti/ipc/ti-ipc-rtos.inc   | 8 ++++----
>   recipes-ti/ipc/ti-ipc.inc        | 4 ++--
>   3 files changed, 7 insertions(+), 7 deletions(-)
>
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
> index 4ec72cc..365486e 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,4 +1,4 @@
> -PV = "3.50.04.06"
> +PV = "3.50.04.07"
>   INC_PR = "r0"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
> diff --git a/recipes-ti/ipc/ti-ipc-rtos.inc b/recipes-ti/ipc/ti-ipc-rtos.inc
> index 460befe..fe2cc99 100644
> --- a/recipes-ti/ipc/ti-ipc-rtos.inc
> +++ b/recipes-ti/ipc/ti-ipc-rtos.inc
> @@ -24,10 +24,10 @@ protocol=${TI_IPC_METADATA_GIT_PROTOCOL};\
>   branch=${TI_IPC_METADATA_GIT_BRANCH};\
>   name=${TI_IPC_METADATA_NAME}"
>   
> -# Corresponds to tag: 3.50.04.06
> -TI_IPC_METADATA_SRCREV = "15d256ea3c3a35fe065a0513f09f4ea6ece58725"
> -# Corresponds to tag: 3.50.04.06
> -TI_IPC_EXAMPLES_SRCREV = "f29c27652302892abbe78ce2c22a2aae28b28d69"
> +# Corresponds to tag: 3.50.04.07
> +TI_IPC_METADATA_SRCREV = "37e85ff1966f7d093fe2bde2dd9d4546f29d0d80"
> +# Corresponds to tag: 3.50.04.07A
> +TI_IPC_EXAMPLES_SRCREV = "0ebf5e642a8ca567bcaa7653875d15f6e7178405"
>   
>   SRCREV_FORMAT = "default"
>   SRCREV_ipc-metadata = "${TI_IPC_METADATA_SRCREV}"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index b9f9ca9..000c5c0 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>   TI_IPC_GIT_PROTOCOL = "git"
>   TI_IPC_GIT_BRANCH = "3.50"
>   
> -#Corresponds to 3.50.04.06
> -TI_IPC_SRCREV = "ca7ce99b8ec82331559f0fd99a174bdcca1da9ac"
> +#Corresponds to 3.50.04.07
> +TI_IPC_SRCREV = "129b6f44c50cbe760a5c1481b34b323b7a42ead5"
>   
>   BRANCH = "${TI_IPC_GIT_BRANCH}"
>   SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"


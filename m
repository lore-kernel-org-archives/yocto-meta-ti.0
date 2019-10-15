Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 6950EE00B8E; Tue, 15 Oct 2019 10:15:50 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at https://www.dnswl.org/, 
	*      medium trust
	*      [198.47.19.142 listed in list.dnswl.org]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from fllv0016.ext.ti.com (fllv0016.ext.ti.com [198.47.19.142])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EA860E007AA
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 10:15:46 -0700 (PDT)
Received: from fllv0034.itg.ti.com ([10.64.40.246])
	by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id x9FHFkUN082104
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 12:15:46 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1571159746;
	bh=UmckL5xEHLAjoF5lmgqBBeuIShuitaCCgddu8YI8DhE=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=gAucIRuYAk7JJUq36ClT+cIcsdAnpaFOnh/U33TKPES7HKA7EYJU8TvubaU3waL/7
	cQryLzvkL1IWKoZVnK42J/cxuTCtE8mqfOtRD1WzU5QUF90YBfhRr4ZrK1K21YKkjE
	XA1PhllUbJdh/gcvtq2jvbSIZR1QNZRCp9razLi0=
Received: from DFLE108.ent.ti.com (dfle108.ent.ti.com [10.64.6.29])
	by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x9FHFkqO094977
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Tue, 15 Oct 2019 12:15:46 -0500
Received: from DFLE107.ent.ti.com (10.64.6.28) by DFLE108.ent.ti.com
	(10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Tue, 15 Oct 2019 12:15:39 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE107.ent.ti.com
	(10.64.6.28) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Tue, 15 Oct 2019 12:15:39 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x9FHFj4c123628;
	Tue, 15 Oct 2019 12:15:45 -0500
To: Sam Nelson <sam.nelson@ti.com>, <meta-ti@yoctoproject.org>
References: <1571089614-51965-1-git-send-email-sam.nelson@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <f2ea46c3-428b-dec8-b0ee-7c0fc6051a25@ti.com>
Date: Tue, 15 Oct 2019 13:15:39 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.9.0
MIME-Version: 1.0
In-Reply-To: <1571089614-51965-1-git-send-email-sam.nelson@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/ti2018.03/master][PATCH] Revert "ti-ipc: Update commit id for latest code for 3.50.04.07"
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
X-List-Received-Date: Tue, 15 Oct 2019 17:15:50 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Please backport to ti2019.03.


Thank you,

Jake

On 10/14/2019 5:46 PM, Sam Nelson wrote:
> This reverts commit 03e5b21e8a993cf3227112de84f38cc8337dcb11.
> ---
>   recipes-ti/ipc/ti-ipc-common.inc | 2 +-
>   recipes-ti/ipc/ti-ipc.inc        | 4 ++--
>   2 files changed, 3 insertions(+), 3 deletions(-)
>
> diff --git a/recipes-ti/ipc/ti-ipc-common.inc b/recipes-ti/ipc/ti-ipc-common.inc
> index 5f4a475..365486e 100644
> --- a/recipes-ti/ipc/ti-ipc-common.inc
> +++ b/recipes-ti/ipc/ti-ipc-common.inc
> @@ -1,5 +1,5 @@
>   PV = "3.50.04.07"
> -INC_PR = "r1"
> +INC_PR = "r0"
>   
>   PACKAGE_ARCH = "${MACHINE_ARCH}"
>   COMPATIBLE_HOST ?= "null"
> diff --git a/recipes-ti/ipc/ti-ipc.inc b/recipes-ti/ipc/ti-ipc.inc
> index 2111f6b..000c5c0 100644
> --- a/recipes-ti/ipc/ti-ipc.inc
> +++ b/recipes-ti/ipc/ti-ipc.inc
> @@ -8,8 +8,8 @@ TI_IPC_GIT_URI = "git://git.ti.com/ipc/ipcdev.git"
>   TI_IPC_GIT_PROTOCOL = "git"
>   TI_IPC_GIT_BRANCH = "3.50"
>   
> -#Corresponds to 3.50.04.07A
> -TI_IPC_SRCREV = "9d26f80f2d7bf85d46e431a3a9ec85d3dfbc74dd"
> +#Corresponds to 3.50.04.07
> +TI_IPC_SRCREV = "129b6f44c50cbe760a5c1481b34b323b7a42ead5"
>   
>   BRANCH = "${TI_IPC_GIT_BRANCH}"
>   SRC_URI = "${TI_IPC_GIT_URI};protocol=${TI_IPC_GIT_PROTOCOL};branch=${BRANCH};name=ipcdev"


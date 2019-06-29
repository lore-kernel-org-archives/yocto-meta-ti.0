Return-Path: <j-stiffler@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D0622E00AF2; Sat, 29 Jun 2019 08:20:29 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.3 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU, RCVD_IN_DNSWL_MED autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -2.3 RCVD_IN_DNSWL_MED RBL: Sender listed at
	https://www.dnswl.org/, *      medium trust
	*      [198.47.23.249 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
Received: from lelv0142.ext.ti.com (lelv0142.ext.ti.com [198.47.23.249])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 672F8E009CF
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 08:20:29 -0700 (PDT)
Received: from lelv0265.itg.ti.com ([10.180.67.224])
	by lelv0142.ext.ti.com (8.15.2/8.15.2) with ESMTP id x5TFKTxV004102
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 10:20:29 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1561821629;
	bh=xfQj36nA5G6+WbHn4iiP3/eDctyvyFLSg5wEbSBqhp0=;
	h=Subject:To:References:From:Date:In-Reply-To;
	b=L6vziB8YFBy6/ZM9vuA6rrRMTmUsxeU5CF+FvS8xSx+U5vr/bK0FxxX16GCZ4FkpF
	yRO4Lf2vFI6/BFuscgImMNALiFqWoYnETU0Kdw1czx4gUOt+yWm64vKq8QwmSouupA
	Lq3YLlWG7YkfKT0TPlWe+MdNVBxk3wKPqk7LtFRw=
Received: from DLEE108.ent.ti.com (dlee108.ent.ti.com [157.170.170.38])
	by lelv0265.itg.ti.com (8.15.2/8.15.2) with ESMTPS id x5TFKT1C032279
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL)
	for <meta-ti@yoctoproject.org>; Sat, 29 Jun 2019 10:20:29 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE108.ent.ti.com
	(157.170.170.38) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5;
	Sat, 29 Jun 2019 10:20:28 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
	(157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1713.5 via
	Frontend Transport; Sat, 29 Jun 2019 10:20:28 -0500
Received: from [158.218.113.191] (ileax41-snat.itg.ti.com [10.172.224.153])
	by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id x5TFKSq3010264;
	Sat, 29 Jun 2019 10:20:28 -0500
To: Mahesh Radhakrishnan <m-radhakrishnan2@ti.com>, <meta-ti@yoctoproject.org>
References: <1561760664-53158-1-git-send-email-m-radhakrishnan2@ti.com>
From: Jacob Stiffler <j-stiffler@ti.com>
Message-ID: <b112c041-17a2-2b2b-c6a0-b875c89c7112@ti.com>
Date: Sat, 29 Jun 2019 11:20:26 -0400
User-Agent: Mozilla/5.0 (Windows NT 6.1; WOW64; rv:60.0) Gecko/20100101
	Thunderbird/60.7.2
MIME-Version: 1.0
In-Reply-To: <1561760664-53158-1-git-send-email-m-radhakrishnan2@ti.com>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Subject: Re: [EXTERNAL] [thud/master][PATCH 0/4] *** RTOS 6.0 Patchset-3 ***
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
X-List-Received-Date: Sat, 29 Jun 2019 15:20:29 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US

Denys,

Can you please backport these to ti2019.01?


Thank you,

Jake

On 6/28/2019 6:24 PM, Mahesh Radhakrishnan wrote:
> This is the RTOS Patchset #3 which addresses the following issue
>   https://jira.itg.ti.com/browse/PRSDK-4321
>
> Mahesh Radhakrishnan (4):
>    board-rtos: SRCREV update to 01.00.10.05C
>    emac-lld-rtos: SRCREV update to 01.00.03.16A
>    pruss-lld: SRCREV update to 01.00.00.14A
>    transport-rtos: SRCREV update to 01.00.00.16A
>
>   recipes-bsp/board-rtos/board-rtos_git.bb  | 6 +++---
>   recipes-bsp/emac-lld/emac-lld-rtos_git.bb | 6 +++---
>   recipes-bsp/pruss-lld/pruss-lld.inc       | 6 +++---
>   recipes-bsp/transport-rtos/transport.inc  | 6 +++---
>   4 files changed, 12 insertions(+), 12 deletions(-)
>


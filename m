Return-Path: <anandb@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 39421E00E3F; Mon,  5 Mar 2018 21:35:10 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.0 required=5.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID, DKIM_VALID_AU,
	RCVD_IN_DNSWL_NONE autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.1 DKIM_VALID_AU Message has a valid DKIM or DK signature from
	author's *       domain
	*  0.1 DKIM_SIGNED Message has a DKIM or DK signature, not necessarily
	*      valid
	* -0.1 DKIM_VALID Message has at least one valid DKIM or DK signature
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [198.47.19.16 listed in list.dnswl.org]
Received: from fllnx209.ext.ti.com (fllnx209.ext.ti.com [198.47.19.16])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id BF758E00EB4
	for <meta-ti@yoctoproject.org>; Mon,  5 Mar 2018 21:34:07 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by fllnx209.ext.ti.com (8.15.1/8.15.1) with ESMTP id w265Y6Z9017858
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 23:34:06 -0600
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ti.com;
	s=ti-com-17Q1; t=1520314446;
	bh=BqpyzWFlysR3wqC8QDdaiNVx4Q93NReI3VY1oAZGR4A=;
	h=Subject:To:CC:References:From:Date:In-Reply-To;
	b=arPOSc43AuQnU9mXajMKuSwK6S1IxbArO1ohb4lzhQFMjuGRWij2tnSuHUianyMVz
	eOIptczV63AnA6Ckpg8NC0/PP0DeudQnlLuzO92mVZifcY94sh3IbRG2iD1nkcfnDu
	17nBCzGlkOMF0ahHtw0pKzxPBKeJEAmLPw074WvU=
Received: from DFLE110.ent.ti.com (dfle110.ent.ti.com [10.64.6.31])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id w265Y6db019684
	for <meta-ti@yoctoproject.org>; Mon, 5 Mar 2018 23:34:06 -0600
Received: from DFLE101.ent.ti.com (10.64.6.22) by DFLE110.ent.ti.com
	(10.64.6.31) with Microsoft SMTP Server (version=TLS1_2,
	cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.1261.35;
	Mon, 5 Mar 2018 23:34:06 -0600
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE101.ent.ti.com
	(10.64.6.22) with Microsoft SMTP Server (version=TLS1_0,
	cipher=TLS_RSA_WITH_AES_256_CBC_SHA) id 15.1.1261.35 via Frontend
	Transport; Mon, 5 Mar 2018 23:34:06 -0600
Received: from [172.24.145.147] (ileax41-snat.itg.ti.com [10.172.224.153])
	by dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id w265Y5xY001326;
	Mon, 5 Mar 2018 23:34:05 -0600
To: Denys Dmytriyenko <denys@ti.com>
References: <1520256599-11474-1-git-send-email-anandb@ti.com>
	<20180306030826.GK29482@edge>
From: Anand Balagopalakrishnan <anandb@ti.com>
Message-ID: <da8cc0d0-d0c5-0f8f-8f52-7d8293460c92@ti.com>
Date: Tue, 6 Mar 2018 11:04:04 +0530
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:52.0) Gecko/20100101
	Thunderbird/52.6.0
MIME-Version: 1.0
In-Reply-To: <20180306030826.GK29482@edge>
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Cc: meta-ti@yoctoproject.org
Subject: Re: [FOR-KROGOTH PATCH v2 1/1] ti-sgx-ddk-um: wlpvr_ws: Map DBM buffers and populate meminfo
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
X-List-Received-Date: Tue, 06 Mar 2018 05:35:10 -0000
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit

Denys,

On 06-Mar-18 8:38 AM, Denys Dmytriyenko wrote:
> Applied, thanks. Should there be similar patches for morty/rocko?

Yes, Eric will send a patch for Morty after verification. Since we are 
yet to open Rocko branch for Graphics, it will have the patch by default.

Regards,
Anand



Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 69298E00DC2; Tue, 18 Oct 2016 22:44:26 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2F03CE00DBC
	for <meta-ti@yoctoproject.org>; Tue, 18 Oct 2016 22:44:24 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8E21C68A01A; Wed, 19 Oct 2016 06:44:23 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 1D12C68A019;
	Wed, 19 Oct 2016 06:44:23 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id 5B5396740107;
	Wed, 19 Oct 2016 07:44:22 +0200 (CEST)
To: Denys Dmytriyenko <denys@ti.com>, meta-ti@yoctoproject.org
References: <93e07642-1cc5-40eb-ac40-2debe67d0c72@email.android.com>
	<212371ab-9b66-e313-9cf3-9b9ce3578807@mlbassoc.com>
	<20161018163138.GW12745@edge> <20161018171729.GI2494@denix.org>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <6d81893c-0349-8f68-7e11-970380fd7dba@mlbassoc.com>
Date: Wed, 19 Oct 2016 07:44:22 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
In-Reply-To: <20161018171729.GI2494@denix.org>
Subject: Re: Can't build for BeagleBone
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
X-List-Received-Date: Wed, 19 Oct 2016 05:44:26 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-18 19:17, Denys Dmytriyenko wrote:
> On Tue, Oct 18, 2016 at 12:31:38PM -0400, Denys Dmytriyenko wrote:
>> On Sun, Oct 16, 2016 at 12:46:19PM +0200, Gary Thomas wrote:
>>> On 2016-10-11 12:47, Denys Dmytriyenko wrote:
>>>> Yeah, I'm also getting this in master. Works fine in krogoth. Haven't yet looked close at it though...
>>>
>>> There seem to be two things wrong here.
>>>
>>> *) Yocto has moved most recipes to use a split source/build tree,
>>>    thus ${S} != ${B}
>>
>> Well, that actually happened quite a long time ago for most of recipes. U-boot
>> was in the unconverted minority for a while, until couple months ago:
>>
>> http://cgit.openembedded.org/openembedded-core/commit/?id=36f110594506fbee5dc18de3a04981f019f2024d
>>
>>
>> As of UBOOT_LOCALVERSION - not sure if generating it fails or rather
>> consumption of it fails inside U-boot Makefiles...
>
> Ok, trying to fix things while attending ELCE last week proved to be futile!
> The issue was Python3 related and I already had the same exact one fixed for
> the kernel, d'oh! The patch is out now.
>

Yes, that fixed it, thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


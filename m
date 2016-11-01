Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id B3BBFE00C86; Mon, 31 Oct 2016 23:29:59 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 78FC3E00C60
	for <meta-ti@yoctoproject.org>; Mon, 31 Oct 2016 23:29:55 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 8862768A01C; Tue,  1 Nov 2016 06:29:54 +0000 (GMT)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 40ED368A019;
	Tue,  1 Nov 2016 06:29:54 +0000 (GMT)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id CC35767402A5;
	Tue,  1 Nov 2016 07:29:53 +0100 (CET)
To: meta-ti@yoctoproject.org
References: <59679b68-74ee-218f-292c-1cb043e05d19@mlbassoc.com>
	<20161031172845.GY12745@edge>
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <056a65a9-a4a7-864a-813b-9b8d574434b2@mlbassoc.com>
Date: Tue, 1 Nov 2016 07:29:53 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.4.0
MIME-Version: 1.0
In-Reply-To: <20161031172845.GY12745@edge>
Subject: Re: Customized kernel
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
X-List-Received-Date: Tue, 01 Nov 2016 06:29:59 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 2016-10-31 18:28, Denys Dmytriyenko wrote:
> On Mon, Oct 31, 2016 at 03:59:55PM +0100, Gary Thomas wrote:
>> I'd like to build a fully customized kernel for my BeagleBoneBlack,
>> starting from the current linux-ti-staging_4.4
>>
>> How do I set my own defconfig for such a setup?  In particular,
>> I want to tweak the config options being used, add some drivers,
>> maybe file systems, etc.
>>
>> Thanks for any pointers
>
> Not sure what the problem is - custom defconfig in the FILESPATH should just
> work...
>

I got it working now, thanks.  I had a search path problem with
the defconfig I wanted to use.

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


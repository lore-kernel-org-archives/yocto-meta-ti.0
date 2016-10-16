Return-Path: <gary@mlbassoc.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id D5339E00547; Sun, 16 Oct 2016 04:17:14 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from mail.analogue-micro.com (mail.analogue-micro.com
	[217.144.149.242])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8ECD1E00519
	for <meta-ti@yoctoproject.org>; Sun, 16 Oct 2016 04:17:12 -0700 (PDT)
Received: by mail.analogue-micro.com (Postfix, from userid 999)
	id 73F7A68A01C; Sun, 16 Oct 2016 12:17:11 +0100 (BST)
Received: from zeus.mlbassoc.com (unknown [10.8.0.2])
	by mail.analogue-micro.com (Postfix) with ESMTP id 34EE968A019;
	Sun, 16 Oct 2016 12:17:11 +0100 (BST)
Received: from [127.0.0.1] (localhost.localdomain [127.0.0.1])
	by zeus.mlbassoc.com (Postfix) with ESMTP id C272B67402B0;
	Sun, 16 Oct 2016 13:17:10 +0200 (CEST)
To: meta-ti@yoctoproject.org
From: Gary Thomas <gary@mlbassoc.com>
Message-ID: <0ac2b27c-8987-9962-709e-589e8bca6d76@mlbassoc.com>
Date: Sun, 16 Oct 2016 13:17:10 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:45.0) Gecko/20100101
	Thunderbird/45.3.0
MIME-Version: 1.0
Subject: Using PRU with BeagleBone and Yocto
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
X-List-Received-Date: Sun, 16 Oct 2016 11:17:14 -0000
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit

I have a PRU cape for my BeagleBoneBlack and would like to use
it with a Poky/Yocto generated image.  All of the info I've
found [so far] about the PRU is based on a raw SDK, not Yocto.

Are there any clues on how to make use of this (I've found the
pru-iscc recipe so I'm hopeful)?

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


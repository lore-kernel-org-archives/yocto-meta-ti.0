Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 24B92E0090A; Mon, 27 Oct 2014 03:24:27 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at
	http://www.dnswl.org/, no *      trust
	*      [68.178.252.236 listed in list.dnswl.org]
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
Received: from p3plsmtpa12-07.prod.phx3.secureserver.net
	(p3plsmtpa12-07.prod.phx3.secureserver.net [68.178.252.236])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 3B3BBE00902
	for <meta-ti@yoctoproject.org>; Mon, 27 Oct 2014 03:24:16 -0700 (PDT)
Received: from [192.168.65.10] ([75.72.225.8])
	by p3plsmtpa12-07.prod.phx3.secureserver.net with 
	id 8AQB1p0080BVjqb01AQBlL; Mon, 27 Oct 2014 03:24:15 -0700
Message-ID: <544E1D4A.3010709@pabigot.com>
Date: Mon, 27 Oct 2014 05:24:10 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.2.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1413999502-15209-1-git-send-email-denis@denix.org>	<5447F323.1010701@ti.com>
	<20141022181708.GP25408@edge> <544E099F.6060001@ti.com>
In-Reply-To: <544E099F.6060001@ti.com>
Subject: Recipes adding firmware in meta-ti
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
X-List-Received-Date: Mon, 27 Oct 2014 10:24:27 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

I think it would be more in keeping with the Yocto way if all these 
firmware capabilities were added through PACKAGECONFIG options in a 
meta-ti bbappend to linux-firmware, rather than through separate recipes.

This is especially true of the firmware added in linux-staging-ti.  If 
those patches are ever upstreamed (I assume that's the intent) then 
stock linux-yocto kernels will be getting the images from 
linux-firmware, and updated versions obtained in future linux-staging-ti 
branches will conflict.

Last I looked, linux-staging-ti had a .elf format firmware blob, which 
is not a supported format for linux-firmware.  Adding it in a bbappend 
produces a QA warning because it gets stripped and the debug version 
doesn't get packaged.  At that time, although both .bin and .elf 
versions of that firmware were available, the code that loaded it would 
only work with the .elf version.

In short, consistently putting firmware into linux-firmware now would 
decrease integration issues both now and in the future.

Just a thought.

Peter


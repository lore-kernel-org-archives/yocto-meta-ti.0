Return-Path: <radu.moisan@intel.com>
Received: from mga02.intel.com (mga02.intel.com [134.134.136.20])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EE91AE011AF
	for <meta-ti@yoctoproject.org>; Wed, 26 Sep 2012 06:46:13 -0700 (PDT)
Received: from orsmga002.jf.intel.com ([10.7.209.21])
	by orsmga101.jf.intel.com with ESMTP; 26 Sep 2012 06:46:13 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="4.80,490,1344236400"; d="scan'208";a="213601870"
Received: from dell-desktop (HELO [10.237.105.32]) ([10.237.105.32])
	by orsmga002.jf.intel.com with ESMTP; 26 Sep 2012 06:46:12 -0700
Message-ID: <506307F1.6030303@intel.com>
Date: Wed, 26 Sep 2012 16:49:37 +0300
From: Radu Moisan <radu.moisan@intel.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:15.0) Gecko/20120827 Thunderbird/15.0
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <5061B4F0.3080505@intel.com> <5062B681.20407@intel.com>
	<CA+2YH7vDWica3F3ORcNJti_3CALGeBNyXFqBZP-nhcDE5Ueokg@mail.gmail.com>
	<5062DC98.20106@intel.com> <5062DDB7.60308@mlbassoc.com>
	<5062F839.302@intel.com> <5062FB00.7080307@mlbassoc.com>
In-Reply-To: <5062FB00.7080307@mlbassoc.com>
Subject: Re: pandaboard not booting
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
X-List-Received-Date: Wed, 26 Sep 2012 13:46:14 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit


> This looks correct - the important bit is that console=ttyO2
>
> Diagnosing why this doesn't come up may be a bit trickier.  One thing 
> that you
> can do is to look at the kernel messages (which are not being 
> printed!).  Thankfully,
> those are kept buffered in memory and you should be able to print them 
> manually.
>
> Give these steps a go:
>   * Boot as you have been, letting it hang after starting the kernel
>   * Press the RESET button on the PandaBoard
>   * Break into U-Boot
>   * Dump the kernel messages via:
>       U-Boot> md LOG_BUF_ADDRESS
>     This will display 256 bytes at LOG_BUF_ADDRESS.  If you just press 
> return, you'll
>     get to see the next 256 bytes, etc.  Keep doing this until the 
> messages stop...
>
> To find the LOG_BUF_ADDRESS, search for __log_buf in the System.map 
> which was created
> when you built your kernel.  This will be in your Yocto build tree 
> .../tmp/work/pandaboard*/linux*/git
> (I think - I don't have a build for this machine handy)  You'll see 
> something like this:
>    $ grep __log_buf tmp/work/panda*/linux*/git/System.map
>    c06d66e9 b __log_buf
> That's a virtual address which corresponds to 0x806d66e9 in physical 
> RAM.  Truncate
> the address to a longword value, i.e. 0x806d66e8 - that's LOG_BUF_ADDRESS
>
> See what you get, it may provide a clue where the kernel is crashing.
>
Everything went ok, except the board doesn't reset when I press the 
reset button, or at least I can't see that in the serial console, it 
stays stuck at line "booting kernel..."

Radu


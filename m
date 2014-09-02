Return-Path: <pab@pabigot.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 5ABD3E0054C; Tue,  2 Sep 2014 15:42:41 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_NONE
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -0.0 RCVD_IN_DNSWL_NONE RBL: Sender listed at http://www.dnswl.org/,
	no *      trust
	*      [173.201.193.230 listed in list.dnswl.org]
X-Greylist: delayed 94 seconds by postgrey-1.32 at yocto-www;
	Tue, 02 Sep 2014 15:42:38 PDT
Received: from p3plsmtpa09-01.prod.phx3.secureserver.net
	(p3plsmtpa09-01.prod.phx3.secureserver.net [173.201.193.230])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 30FF6E004F5
	for <meta-ti@yoctoproject.org>; Tue,  2 Sep 2014 15:42:38 -0700 (PDT)
Received: from [192.168.65.10] ([66.41.60.82])
	by p3plsmtpa09-01.prod.phx3.secureserver.net with 
	id mNh11o00N1mTNtu01Nh2fF; Tue, 02 Sep 2014 15:41:03 -0700
Message-ID: <5406477D.7070400@pabigot.com>
Date: Tue, 02 Sep 2014 17:41:01 -0500
From: "Peter A. Bigot" <pab@pabigot.com>
Organization: Peter Bigot Consulting, LLC
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:31.0) Gecko/20100101 Thunderbird/31.0
MIME-Version: 1.0
To: Tom Rini <trini@ti.com>
References: <5405349A.4050207@pabigot.com>
	<1409627490-28337-1-git-send-email-pab@pabigot.com>
	<20140902164451.GV19374@bill-the-cat>
	<5405F7C1.2060809@pabigot.com>
	<20140902220148.GZ19374@bill-the-cat>
In-Reply-To: <20140902220148.GZ19374@bill-the-cat>
Cc: meta-ti@yoctoproject.org, Pantelis Antoniou <panto@antoniou-consulting.com>
Subject: Re: [ti-uboot][PATCH] mmc: restore capacity when switching to partition 0
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
X-List-Received-Date: Tue, 02 Sep 2014 22:42:41 -0000
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit

On 09/02/2014 05:01 PM, Tom Rini wrote:
> On Tue, Sep 02, 2014 at 12:00:49PM -0500, Peter A. Bigot wrote:
>>
>> If I update this patch, will you see the patch gets into ti-uboot?
> This is probably "good enough" for meta-ti, especially if you get it
> into mainline as it could be in v2014.10.

If the existing patch is ok for you to put into ti-uboot I won't rework 
it.  Thanks.

I've verified the problem does exist in 2014.10-rc2 and will prepare a 
patch and submit it upstream.

Peter



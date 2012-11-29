Return-Path: <gary@mlbassoc.com>
Received: from mail.chez-thomas.org (mail.mlbassoc.com [65.100.170.105])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6D6A2E006D5
	for <meta-ti@yoctoproject.org>; Thu, 29 Nov 2012 07:01:16 -0800 (PST)
Received: by mail.chez-thomas.org (Postfix, from userid 1998)
	id 8B6BBF811FE; Thu, 29 Nov 2012 08:01:04 -0700 (MST)
X-Spam-Checker-Version: SpamAssassin 3.3.2 (2011-06-06) on
	hermes.chez-thomas.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.9 required=4.0 tests=ALL_TRUSTED,BAYES_00
	autolearn=unavailable version=3.3.2
Received: from [192.168.1.114] (zeus [192.168.1.114])
	by mail.chez-thomas.org (Postfix) with ESMTP id D6CC1F81200;
	Thu, 29 Nov 2012 08:00:40 -0700 (MST)
Message-ID: <50B778C4.1040507@mlbassoc.com>
Date: Thu, 29 Nov 2012 08:01:24 -0700
From: Gary Thomas <gary@mlbassoc.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:16.0) Gecko/20121028 Thunderbird/16.0.2
MIME-Version: 1.0
To: Nicolas Dechesne <ndec13@gmail.com>
References: <50B64752.6080607@mlbassoc.com> <20121128171902.GB7172@edge>
	<50B649FB.30609@mlbassoc.com>
	<CAOT3miJFxSCs7yPRr2xZ-Wc51YFF7KAS_SQMeQoN43rDFDuPqw@mail.gmail.com>
	<20121128173412.GC7172@edge> <50B66CDF.9050405@mlbassoc.com>
	<20121128201702.GA14141@edge> <50B67860.80001@mlbassoc.com>
	<CAOT3miLEyp4iQQ-AudSxo1q+woHLHC0mRsm3UJpadtfDCY+TTw@mail.gmail.com>
In-Reply-To: <CAOT3miLEyp4iQQ-AudSxo1q+woHLHC0mRsm3UJpadtfDCY+TTw@mail.gmail.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Can't build recipes-graphics/xorg-xserver/xf86-video-omap_git.bb
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
X-List-Received-Date: Thu, 29 Nov 2012 15:01:16 -0000
Content-Type: text/plain; charset=ISO-8859-1; format=flowed
Content-Transfer-Encoding: 7bit

On 2012-11-28 13:50, Nicolas Dechesne wrote:
> On Wed, Nov 28, 2012 at 9:47 PM, Gary Thomas <gary@mlbassoc.com> wrote:
>> My bad :-(  I still had the old meta-ti recipe in my tree which got
>> in the way...
>>
>> I've now managed to build this, yet to test it on my OMAP4 board.
>
> nice... with omapdrm+xf86-video-omap, you should be able to play with
> xrandr for dynamic display (X11) resize and even rotation..
>

Any clues on how to test that (I'm not familiar with xrandr)

Also, with this driver when X blanks the screen (idle/timeout), it
just goes white, not actually disabled/black like the 'fbdev' driver.
Is that something I can configure?  This is important because this
is for a battery based device and I need to be careful with every
drop of power use...

Thanks

-- 
------------------------------------------------------------
Gary Thomas                 |  Consulting for the
MLB Associates              |    Embedded world
------------------------------------------------------------


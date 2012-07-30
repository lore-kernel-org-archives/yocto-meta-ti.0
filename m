Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id B2EB1E0027D
	for <meta-ti@yoctoproject.org>; Mon, 30 Jul 2012 15:31:52 -0700 (PDT)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id q6UMVo6S022276;
	Mon, 30 Jul 2012 17:31:50 -0500
Received: from DLEE74.ent.ti.com (dlee74.ent.ti.com [157.170.170.8])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id q6UMVof4000747;
	Mon, 30 Jul 2012 17:31:50 -0500
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Mon, 30 Jul 2012 17:31:50 -0500
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id q6UMVoHC022171;
	Mon, 30 Jul 2012 17:31:50 -0500
Date: Mon, 30 Jul 2012 18:31:50 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: maniacbug <maniacbug@ymail.com>
Message-ID: <20120730223150.GD23003@edge>
References: <1343681420.8942.YahooMailNeo@web121606.mail.ne1.yahoo.com>
MIME-Version: 1.0
In-Reply-To: <1343681420.8942.YahooMailNeo@web121606.mail.ne1.yahoo.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: Sound on Pandaboard?
X-BeenThere: meta-ti@yoctoproject.org
X-Mailman-Version: 2.1.13
Precedence: list
List-Id: Mailing list for the meta-ti layer <meta-ti.yoctoproject.org>
List-Unsubscribe: <https://lists.yoctoproject.org/options/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=unsubscribe>
List-Archive: <http://lists.yoctoproject.org/pipermail/meta-ti>
List-Post: <mailto:meta-ti@yoctoproject.org>
List-Help: <mailto:meta-ti-request@yoctoproject.org?subject=help>
List-Subscribe: <https://lists.yoctoproject.org/listinfo/meta-ti>,
	<mailto:meta-ti-request@yoctoproject.org?subject=subscribe>
X-List-Received-Date: Mon, 30 Jul 2012 22:31:52 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Mon, Jul 30, 2012 at 01:50:20PM -0700, maniacbug wrote:
> Hi. As mentioned before, I'm running "Yocto (Built by Poky 7.0) 1.2" on 
> Pandaboard with meta-ti. Thanks for the previous help on video, "ffplay" 
> from libav (ported from openembedded) is playing video only now (not audio).
> 
> 
> As a simple test, I'm now trying to play an MP3 file with gaku (the Sato
> music player). This results in 3 lines of the following per attempt:
> 
> Jul 25 13:48:23 pandaboard user.warn kernel: [ 30.949951] SDP4430 Media: 
> asoc: SDP4430 Media no valid playback route from source to sink
> 
> aplay gives the same result, and adds:
> 
> ALSA lib pcm_dmix.c:1018:(snd_pcm_dmix_open) unable to open slave
> aplay: main:682: audio open error: Invalid argument
> 
> Is there anything particular I should be setting up in meta-ti to enable 
> audio? (Or should this question be posed on the yocto list instead?)

First of all, this is definitely the correct mailing list for the question!

Second, I personally haven't played with Pandaboard for several months now 
(see the previous email about best effort...), but one of the options would be 
to look into latest code in this repository:

http://dev.omapzoom.org/?p=integration/kernel-ubuntu.git;a=summary

Unless someone else comes with a more obvious solution (Roger, any hints? :) 
to your problem, I would recommend looking into one of the latest branches in 
the above integration tree.

-- 
Denys


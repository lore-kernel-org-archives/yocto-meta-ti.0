Return-Path: <wmills@ti.com>
Received: from devils.ext.ti.com (devils.ext.ti.com [198.47.26.153])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 28B36E00592
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 14:44:07 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by devils.ext.ti.com (8.13.7/8.13.7) with ESMTP id q0QMi6sb024825
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 16:44:06 -0600
Received: from DFLE70.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q0QMi6L4008073
	for <meta-ti@yoctoproject.org>; Thu, 26 Jan 2012 16:44:06 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle70.ent.ti.com
	(128.247.5.40) with Microsoft SMTP Server id 14.1.323.3;
	Thu, 26 Jan 2012 16:44:06 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q0QMi5ug005464;	Thu, 26 Jan 2012 16:44:05 -0600
Message-ID: <4F21D735.5000303@ti.com>
Date: Thu, 26 Jan 2012 17:44:05 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Chase Maupin <Chase.Maupin@ti.com>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
In-Reply-To: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
Cc: meta-ti@yoctoproject.org
Subject: Re: [PATCH 1/3] matrix-gui-browser: port from arago overlay
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
X-List-Received-Date: Thu, 26 Jan 2012 22:44:07 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit

On 01/26/2012 01:46 PM, Chase Maupin wrote:
> * This package adds a simple web browser GUI application with
>    no decorations used to display matrix on the local display.
> * Ported from arago overlay
>

Sorry for hijacking your patch Chase but I have serious big picture 
questions about all this stuff going into meta-ti and especially all 
into one layer.

meta-ti is suppose to be the TI specific stuff people need to support 
their platforms regardless of what layer stack they are using.  I 
understand we are not layer stack independent yet but that needs to be 
the goal.  Certainly adding a whole bunch of non-HW related stuff into 
the same layer is not going to move us any closer.

When we talked about where matrix belonged before there was debate about 
meta-oe or meta-arago.  When did I miss the memo that put it into meta-ti??



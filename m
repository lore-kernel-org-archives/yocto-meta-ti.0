Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 6EFF1E006C6
	for <meta-ti@yoctoproject.org>; Tue, 28 Jan 2014 18:57:49 -0800 (PST)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s0T2vlVl008171;
	Tue, 28 Jan 2014 20:57:47 -0600
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0T2vluM031673;
	Tue, 28 Jan 2014 20:57:47 -0600
Received: from dlep32.itg.ti.com (157.170.170.100) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.2.342.3;
	Tue, 28 Jan 2014 20:57:46 -0600
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s0T2vkWb020306;
	Tue, 28 Jan 2014 20:57:46 -0600
Date: Tue, 28 Jan 2014 21:57:46 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: JeHo Park <linuxpark@gmail.com>
Message-ID: <20140129025745.GN6814@edge>
References: <52C1B8CF.7080109@gmail.com>
MIME-Version: 1.0
In-Reply-To: <52C1B8CF.7080109@gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: i want to know what git branch i have to download ?
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
X-List-Received-Date: Wed, 29 Jan 2014 02:57:56 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 31, 2013 at 03:17:51AM +0900, JeHo Park wrote:
> hellow everyone !
> i am newbies for this project
> i have the dm368evm board so i applied ti sdk 4.0.2 -
> http://www.ti.com/tool/linuxdvsdk-dm36x
> but the performance of video, h.264 and audio, aac was so poor ..
> especially, load of cpu was over 50% :(
> 
> so i wonder whether i can get some new version of bsp and filesystem for
> my dm368evm board from this arago project or not ??
> if it is possible, i want to know which branch i have to download using
> the git ?
> 
> previously thanks ~

Unfortunately, meta-ti does not support DM368 platform. I'd recommend you to 
seek help with DVSDK on TI e2e forum - hopefully somebody will be able to 
help you. Thank you.

-- 
Denys


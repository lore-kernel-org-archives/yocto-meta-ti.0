Return-Path: <denys@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CADF4E00777
	for <meta-ti@yoctoproject.org>; Tue, 11 Dec 2012 14:14:41 -0800 (PST)
Received: from dlelxv30.itg.ti.com ([172.17.2.17])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id qBBMEeFm016682;
	Tue, 11 Dec 2012 16:14:40 -0600
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dlelxv30.itg.ti.com (8.13.8/8.13.8) with ESMTP id qBBMEesA015141;
	Tue, 11 Dec 2012 16:14:40 -0600
Received: from dlelxv22.itg.ti.com (172.17.1.197) by dfle73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 11 Dec 2012 16:14:40 -0600
Received: from localhost ([158.218.102.158])	by dlelxv22.itg.ti.com
	(8.13.8/8.13.8) with ESMTP id qBBMEeOe002535;
	Tue, 11 Dec 2012 16:14:40 -0600
Date: Tue, 11 Dec 2012 17:14:39 -0500
From: Denys Dmytriyenko <denys@ti.com>
To: Nicolas Dechesne <ndec13@gmail.com>
Message-ID: <20121211221439.GD17542@edge>
References: <CAOT3miLrspTsg-YTp-yaiacN7zi6zzMYghTjDH=yqXdAgGsnmA@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CAOT3miLrspTsg-YTp-yaiacN7zi6zzMYghTjDH=yqXdAgGsnmA@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: meta-ti master build broken
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
X-List-Received-Date: Tue, 11 Dec 2012 22:14:42 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Dec 11, 2012 at 11:12:30PM +0100, Nicolas Dechesne wrote:
> hi,
> 
> i just noticed that meta-ti + poky/master is broken since some mesa
> updates were merged
> 
> 66d92cb mesa-dri: upgrade -git version to current master
> a63dc47 mesa: upgrade to 8.0.5
> 
> I suspect something along these lines should fix the problem:
> 
> $ git diff --cached -M
> diff --git a/recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
> b/recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
> similarity index 100%
> rename from recipes-graphics/mesa/mesa-dri_8.0.4.bbappend
> rename to recipes-graphics/mesa/mesa-dri_8.0.5.bbappend
> 
> however I can't test that right now on any plaform... so I just wanted
> to share the information with the hope that someone can fix it quicker
> than me.

Thanks for reporting! I'll take a look at it.

-- 
Denys


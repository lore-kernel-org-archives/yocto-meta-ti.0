Return-Path: <wmills@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 8C1E4E0132F
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 06:08:20 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id q26E8JAN016157;
	Tue, 6 Mar 2012 08:08:19 -0600
Received: from DLEE74.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q26E8JNa014813;
	Tue, 6 Mar 2012 08:08:19 -0600 (CST)
Received: from dlelxv22.itg.ti.com (172.17.1.197) by DLEE74.ent.ti.com
	(157.170.170.8) with Microsoft SMTP Server id 14.1.323.3;
	Tue, 6 Mar 2012 08:08:19 -0600
Received: from gtwmills.gt.design.ti.com (gtwmills.gt.design.ti.com
	[158.218.100.52])	by dlelxv22.itg.ti.com (8.13.8/8.13.8) with ESMTP id
	q26E8ILw029435;	Tue, 6 Mar 2012 08:08:18 -0600
Message-ID: <4F561A52.5090209@ti.com>
Date: Tue, 6 Mar 2012 09:08:18 -0500
From: William Mills <wmills@ti.com>
User-Agent: Mozilla/5.0 (X11; U; Linux i686; en-US;
	rv:1.9.2.18) Gecko/20110617 Thunderbird/3.1.11
MIME-Version: 1.0
To: Denys Dmytriyenko <denis@denix.org>
References: <20120306005241.GF2030@denix.org>
In-Reply-To: <20120306005241.GF2030@denix.org>
Cc: meta-ti@yoctoproject.org
Subject: Re: Fw: OpenEmbbedded as a test suite next steps
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
X-List-Received-Date: Tue, 06 Mar 2012 14:08:20 -0000
Content-Type: text/plain; charset="ISO-8859-1"; format=flowed
Content-Transfer-Encoding: 7bit


On 03/05/2012 07:52 PM, Denys Dmytriyenko wrote:
> All,
>
> Early planning stages of what's going to be a meta-linaro toolchain layer for
> OE-Core/Yocto. Interesting stuff, we should probably pitch in for some of the
> items there, that we can help with - such as selection of the platforms with
> recent kernels and possibly cloud builds... Any thoughts?
>

Yes, absolutely, I do indeed concur wholeheartedly!

I was about to suggest that for kernel they just target the qemu arm 
machine.  Does oe-core treat that as armv7?



Return-Path: <denys@ti.com>
Received: from comal.ext.ti.com (comal.ext.ti.com [198.47.26.152])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 7D6C5E00C24
	for <meta-ti@yoctoproject.org>; Mon, 31 Mar 2014 13:09:08 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by comal.ext.ti.com (8.13.7/8.13.7) with ESMTP id s2VK97q5016520;
	Mon, 31 Mar 2014 15:09:07 -0500
Received: from DLEE70.ent.ti.com (dlemailx.itg.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2VK97dH023945;
	Mon, 31 Mar 2014 15:09:07 -0500
Received: from dlep33.itg.ti.com (157.170.170.75) by DLEE70.ent.ti.com
	(157.170.170.113) with Microsoft SMTP Server id 14.3.174.1;
	Mon, 31 Mar 2014 15:09:06 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dlep33.itg.ti.com (8.14.3/8.13.8) with ESMTP id s2VK96HK028193;
	Mon, 31 Mar 2014 15:09:06 -0500
Date: Mon, 31 Mar 2014 16:09:06 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Linux mail <4linuxmail@gmail.com>
Message-ID: <20140331200905.GK12929@edge>
References: <CABtHMwd3KWEqzXq0NrGCPF0o02EUoBkeevwNrTi-x3Kk3+148A@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABtHMwd3KWEqzXq0NrGCPF0o02EUoBkeevwNrTi-x3Kk3+148A@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: DRA6xx Yocto support
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
X-List-Received-Date: Mon, 31 Mar 2014 20:09:10 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Sat, Mar 29, 2014 at 11:41:57PM -0600, Linux mail wrote:
> Hello All,
> 
> I did search information about the DRA6xx Yocto support but did not find
> anything, so, my question is: Is there any Yocto support for that micro?

There's no DRA6xx support in meta-ti, only DRA7xx.


> If not, I suspect that could be because of the kernel version (2.6.37 I
> think) and LTIB is used instead, is that correct?
> 
> Furthermore, how easy/hard would be to get such micro (and kernel
> version) using Yocto for a mid-experienced Yocto user?

Should be relatively doable, if you have access to the BSP pieces, like kernel 
and bootloader...

-- 
Denys


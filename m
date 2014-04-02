Return-Path: <denys@ti.com>
Received: from arroyo.ext.ti.com (arroyo.ext.ti.com [192.94.94.40])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D9538E00B83
	for <meta-ti@yoctoproject.org>; Tue,  1 Apr 2014 20:23:02 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by arroyo.ext.ti.com (8.13.7/8.13.7) with ESMTP id s323N1eC028923;
	Tue, 1 Apr 2014 22:23:01 -0500
Received: from DFLE73.ent.ti.com (dfle73.ent.ti.com [128.247.5.110])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s323N1UA009173;
	Tue, 1 Apr 2014 22:23:01 -0500
Received: from dflp32.itg.ti.com (10.64.6.15) by DFLE73.ent.ti.com
	(128.247.5.110) with Microsoft SMTP Server id 14.3.174.1;
	Tue, 1 Apr 2014 22:23:00 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])	by
	dflp32.itg.ti.com (8.14.3/8.13.8) with ESMTP id s323N0JF013434;
	Tue, 1 Apr 2014 22:23:00 -0500
Date: Tue, 1 Apr 2014 23:23:00 -0400
From: Denys Dmytriyenko <denys@ti.com>
To: Linux mail <4linuxmail@gmail.com>
Message-ID: <20140402032300.GP12929@edge>
References: <CABtHMwfFOJeGfx-ke7hAQm3+1HAdBJnPp=QZMfDTiGxKq_sr7w@mail.gmail.com>
MIME-Version: 1.0
In-Reply-To: <CABtHMwfFOJeGfx-ke7hAQm3+1HAdBJnPp=QZMfDTiGxKq_sr7w@mail.gmail.com>
User-Agent: Mutt/1.5.20 (2009-06-14)
Cc: meta-ti@yoctoproject.org
Subject: Re: DRA7xx Media Local Bus driver
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
X-List-Received-Date: Wed, 02 Apr 2014 03:23:04 -0000
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline

On Tue, Apr 01, 2014 at 05:55:56PM -0600, Linux mail wrote:
> Hello,
> 
> The Jacinto6 DRA74x processor supports MOST Media Local Bus (MLB) but I
> could not find a driver in the Yocto Linux kernel.
> 
> Do you know if there is available a MLB Linux driver for DRA74x?

The latest kernel for DRA7xx that is provided by meta-ti layer is pulled from 
here:

http://git.ti.com/gitweb/?p=ti-linux-kernel/ti-linux-kernel.git;a=shortlog;h=refs/heads/ti-linux-3.12.y

That is currently the fullest support for that platform.

-- 
Denys


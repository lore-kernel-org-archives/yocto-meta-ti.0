Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D37BEE00348
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 13:51:38 -0800 (PST)
Received: from [192.168.0.2] (host81-153-112-132.range81-153.btcentralplus.com
	[81.153.112.132]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id 097719BE3
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 21:51:37 +0000 (GMT)
Message-ID: <50A2C0E8.9030300@r-finger.com>
Date: Tue, 13 Nov 2012 21:51:36 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
	<50A26971.40908@r-finger.com>
	<alpine.DEB.2.02.1211131041310.4591@oneiric>
	<20121113154444.GB12650@edge>
	<CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
In-Reply-To: <CAFNBftf5ACAEFEtLpoVB3b9pc_d1MROgn19NBJmQWX2u362Ucw@mail.gmail.com>
Subject: Re: Help with building gstreamer-ti on beagleboard
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
X-List-Received-Date: Tue, 13 Nov 2012 21:51:39 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/12 21:25, Flavio Castro Alves Filho wrote:
> 2012/11/13 Denys Dmytriyenko <denys@ti.com>
>>>>> Why can't you put meta-ti in front of meta-yocto in Denzil? Works
>> just fine.
> 
> I did that here and it doens't work.

As I explained earlier, for Denzil the order makes no real difference.
Just delete meta-yocto/conf/machine/beagleboard.conf.

But this has been all sorted out in the Danny release by splitting out
the bsp stuff into meta-yocto-bsp; if you are creating a new set up you
would be better to use Danny anyway.

Tomas

-- 
http://sleepfive.com


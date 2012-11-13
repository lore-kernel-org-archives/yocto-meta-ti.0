Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CD197E0032E
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 07:38:26 -0800 (PST)
Received: from [192.168.0.2] (host81-153-112-132.range81-153.btcentralplus.com
	[81.153.112.132]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id EFBCA9BE3
	for <meta-ti@yoctoproject.org>; Tue, 13 Nov 2012 15:38:25 +0000 (GMT)
Message-ID: <50A26971.40908@r-finger.com>
Date: Tue, 13 Nov 2012 15:38:25 +0000
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
CC: meta-ti@yoctoproject.org
References: <CAFNBfte2-bE2o2XCu_nVUcFXukfbvd5fujvoB59fYZHOWyGtdw@mail.gmail.com>
	<50A26410.5030405@r-finger.com> <20121113152237.GA12650@edge>
In-Reply-To: <20121113152237.GA12650@edge>
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
X-List-Received-Date: Tue, 13 Nov 2012 15:38:27 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 13/11/12 15:22, Denys Dmytriyenko wrote:
>> For Denzil it is not possible to arrange meta-yocto and meta-ti layers
>> in a way that would work; this has been fixed in Danny (in
>> meta-yocto-bsp). If you want to stick with Denzil, there are different
>> ways to work around it, easiest should be to delete the offending
>> beagleboard.conf from meta-yocto.
> 
> Why can't you put meta-ti in front of meta-yocto in Denzil? Works just fine.

Because meta-yocto layer.conf does:

  BBPATH := "${LAYERDIR}:${BBPATH}"

While meta-ti layer.conf does:

  BBPATH .= ":${LAYERDIR}"

So regardless how you order it, you get BBPATH that looks like:

  meta-yocto:meta:meta-ti

Which guarantees you the beagleboard.conf from meta-yocto.

Tomas


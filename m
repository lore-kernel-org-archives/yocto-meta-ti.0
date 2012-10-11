Return-Path: <tf+lists.yocto@r-finger.com>
Received: from r-finger.com (r-finger.com [178.79.160.5])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id CB6C3E0027E
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 12:28:24 -0700 (PDT)
Received: from [192.168.0.2] (host81-153-82-212.range81-153.btcentralplus.com
	[81.153.82.212]) (using TLSv1 with cipher AES256-SHA (256/256 bits))
	(No client certificate requested)
	by r-finger.com (Postfix) with ESMTPSA id DB23E99A4
	for <meta-ti@yoctoproject.org>; Thu, 11 Oct 2012 20:28:09 +0100 (BST)
Message-ID: <50771DC8.3090903@r-finger.com>
Date: Thu, 11 Oct 2012 20:28:08 +0100
From: Tomas Frydrych <tf+lists.yocto@r-finger.com>
User-Agent: Mozilla/5.0 (X11; Linux x86_64;
	rv:10.0.5) Gecko/20120624 Icedove/10.0.5
MIME-Version: 1.0
To: meta-ti@yoctoproject.org
References: <1349912433-21880-1-git-send-email-ebutera@users.berlios.de>
	<1349912433-21880-5-git-send-email-ebutera@users.berlios.de>
	<CAOT3miL8hqQ+AZWwpgAaw1KNpSDdrcik=vHgf0BQksFew9ZzbQ@mail.gmail.com>
	<CA+2YH7tNDTLGHWr3ASFXRQ_H2L+LyDsMqO8s4pZFRbPA94fXmA@mail.gmail.com>
	<CAOT3miLOLK-3L7Pwcp6WHEbTm_kfcY0xRUSWNCZDQ8yDNYL-wQ@mail.gmail.com>
	<CA+2YH7s0YnPBXb8VRYW7DbjMxH7ed8u+J=q84-qC9ZzC4ULxow@mail.gmail.com>
	<CAOT3miK8prycvqfTNSJXEnTsAtfwxhAk_FaCPX_PACxX0Zu-MQ@mail.gmail.com>
	<5076C554.6060200@mlbassoc.com>
	<CAPj87rMrJ4D6fnY4kw5dBkogzqjDCVPiccGzM3TpWCWkN9FzCg@mail.gmail.com>
	<5076D6CC.5010303@mlbassoc.com>
	<CAOT3mi+Ad=aB_mc11DUmybMvEcySnGUzs6rDke+-mi2ZbBtxrQ@mail.gmail.com>
In-Reply-To: <CAOT3mi+Ad=aB_mc11DUmybMvEcySnGUzs6rDke+-mi2ZbBtxrQ@mail.gmail.com>
Subject: Re: [PATCH 5/6] gstreamer: bbappend to use TI-patched versions needed for gst-plugin-ducati
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
X-List-Received-Date: Thu, 11 Oct 2012 19:28:25 -0000
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 11/10/12 20:16, Nicolas Dechesne wrote:
> unfortunately, the provision for that isn't really there, since the
> gstreamer recipes don't have the 'x.y' in the name. was that discussed
> anywhere? could we ensure that gst1.0 comes as
> 'gstreamer1.0_1.0.0.bb'?

I don't think there is anything at all gained by supporting
simultaneously installing two versions of gstreamer; it makes no real
sense on distro level. More so adding a version into a package name
creates a world of pain and dependency hell. Would it not be enough to
have _0.10 and _1.0 recipes alongside each other, one of which would
have DEFAULT_PRIORITY=-1; a distro then can choose an appropriate
version as it wants to?

Tomas



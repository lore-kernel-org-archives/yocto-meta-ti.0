Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 150D1E00592
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 03:50:59 -0800 (PST)
Received: by wejx9 with SMTP id x9so1617772wej.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 03:50:58 -0800 (PST)
Received: by 10.216.131.78 with SMTP id l56mr3431941wei.56.1327665058194;
	Fri, 27 Jan 2012 03:50:58 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id df2sm11235476wib.4.2012.01.27.03.50.57
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 03:50:57 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F21D735.5000303@ti.com>
Date: Fri, 27 Jan 2012 12:50:55 +0100
Message-Id: <27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Fri, 27 Jan 2012 11:51:00 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 26 jan. 2012, om 23:44 heeft William Mills het volgende geschreven:

> On 01/26/2012 01:46 PM, Chase Maupin wrote:
>> * This package adds a simple web browser GUI application with
>>   no decorations used to display matrix on the local display.
>> * Ported from arago overlay
>>=20
>=20
> Sorry for hijacking your patch Chase but I have serious big picture =
questions about all this stuff going into meta-ti and especially all =
into one layer.
>=20
> meta-ti is suppose to be the TI specific stuff people need to support =
their platforms regardless of what layer stack they are using.  I =
understand we are not layer stack independent yet but that needs to be =
the goal.  Certainly adding a whole bunch of non-HW related stuff into =
the same layer is not going to move us any closer.
>=20
> When we talked about where matrix belonged before there was debate =
about meta-oe or meta-arago.  When did I miss the memo that put it into =
meta-ti??

Since meta-arago is supposed to be as empty as possible and matrix =
doesn't play well with others it's a bad fit for both meta-arago and =
meta-oe. Maybe we should split the meta-ti repo into 2 layers: one for =
BSP things (including sgx, dsp, etc) and one for 'sdk' things (matrix).
The idea is to keep reusable TI deliverables together without forcing =
people to use arago. Putting matrix in meta-arago would mean you can =
only use it with DISTRO=3Darago, which is a huge step backwards from the =
current situation.

regards,

Koen=


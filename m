Return-Path: <koen@dominion.thruhere.net>
Received: from mail-we0-f176.google.com (mail-we0-f176.google.com
	[74.125.82.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id EBD66E00599
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 11:47:34 -0800 (PST)
Received: by wejx9 with SMTP id x9so2190030wej.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 11:47:33 -0800 (PST)
Received: by 10.216.135.167 with SMTP id u39mr1461982wei.51.1327693653285;
	Fri, 27 Jan 2012 11:47:33 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id m8sm26072939wia.11.2012.01.27.11.47.31
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 11:47:32 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <20120127193923.GB8707@denix.org>
Date: Fri, 27 Jan 2012 20:47:29 +0100
Message-Id: <FF4B271D-2A5F-4DFF-B784-B94980454611@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
	<FCA44E54-9FAC-4905-86BE-C5A50092A880@dominion.thruhere.net>
	<20120127193923.GB8707@denix.org>
To: Denys Dmytriyenko <denis@denix.org>
X-Mailer: Apple Mail (2.1251.1)
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
X-List-Received-Date: Fri, 27 Jan 2012 19:47:35 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 20:39 heeft Denys Dmytriyenko het volgende =
geschreven:

> On Fri, Jan 27, 2012 at 01:24:14PM +0100, Koen Kooi wrote:
>>=20
>> Op 27 jan. 2012, om 13:09 heeft Andreas M?ller het volgende =
geschreven:
>>=20
>>> On Fri, Jan 27, 2012 at 12:50 PM, Koen Kooi =
<koen@dominion.thruhere.net>=20
>>> wrote:
>>>> Since meta-arago is supposed to be as empty as possible and matrix=20=

>>>> doesn't play well with others it's a bad fit for both meta-arago =
and=20
>>>> meta-oe. Maybe we should split the meta-ti repo into 2 layers: one =
for=20
>>>> BSP things (including sgx, dsp, etc) and one for 'sdk' things =
(matrix).
>>>> The idea is to keep reusable TI deliverables together without =
forcing=20
>>>> people to use arago. Putting matrix in meta-arago would mean you =
can only=20
>>>> use it with DISTRO=3Darago, which is a huge step backwards from the =
current=20
>>>> situation.
>>>=20
>>> I think splitting out BSP into an own layer is a good idea and sorry
>>> for another hijacking: This would be a good chance to make it
>>> independent of angstrom ( e.g ti-hw-bringup ).
>>=20
>> Image reuse is the least of the issues, SOC_FAMILY is a much larger =
one.
>=20
> Koen,
>=20
> Can you please elaborate on the SOC_FAMILY issue you mentioned? =
Thanks.

We need support for it, only angstrom does at the moment. The big =
problem is that the solution can't be layer-local since other layers =
will use it as well. Having duplicates in OVERRIDES is a nightmare.=


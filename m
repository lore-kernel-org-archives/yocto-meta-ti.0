Return-Path: <koen@dominion.thruhere.net>
Received: from mail-wi0-f176.google.com (mail-wi0-f176.google.com
	[209.85.212.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id C1756E00592
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 04:24:18 -0800 (PST)
Received: by wibhq12 with SMTP id hq12so1648753wib.35
	for <meta-ti@yoctoproject.org>; Fri, 27 Jan 2012 04:24:17 -0800 (PST)
Received: by 10.180.109.77 with SMTP id hq13mr11251342wib.7.1327667057375;
	Fri, 27 Jan 2012 04:24:17 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id fr8sm22603617wib.10.2012.01.27.04.24.16
	(version=TLSv1/SSLv3 cipher=OTHER);
	Fri, 27 Jan 2012 04:24:16 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1251.1)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
Date: Fri, 27 Jan 2012 13:24:14 +0100
Message-Id: <FCA44E54-9FAC-4905-86BE-C5A50092A880@dominion.thruhere.net>
References: <1327603585-5599-1-git-send-email-Chase.Maupin@ti.com>
	<4F21D735.5000303@ti.com>
	<27324814-C581-4BD9-92DF-68FC5CB4CECF@dominion.thruhere.net>
	<CALbNGRTQSj696KijHn+UU45e9Z+-JhWW5FUv0GUx724PgfzpZA@mail.gmail.com>
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
X-List-Received-Date: Fri, 27 Jan 2012 12:24:19 -0000
Content-Type: text/plain; charset=iso-8859-1
Content-Transfer-Encoding: quoted-printable


Op 27 jan. 2012, om 13:09 heeft Andreas M=FCller het volgende =
geschreven:

> On Fri, Jan 27, 2012 at 12:50 PM, Koen Kooi =
<koen@dominion.thruhere.net> wrote:
>> Since meta-arago is supposed to be as empty as possible and matrix =
doesn't play well with others it's a bad fit for both meta-arago and =
meta-oe. Maybe we should split the meta-ti repo into 2 layers: one for =
BSP things (including sgx, dsp, etc) and one for 'sdk' things (matrix).
>> The idea is to keep reusable TI deliverables together without forcing =
people to use arago. Putting matrix in meta-arago would mean you can =
only use it with DISTRO=3Darago, which is a huge step backwards from the =
current situation.
>>=20
> I think splitting out BSP into an own layer is a good idea and sorry
> for another hijacking: This would be a good chance to make it
> independent of angstrom ( e.g ti-hw-bringup ).

Image reuse is the least of the issues, SOC_FAMILY is a much larger one.

regards,

Koen=


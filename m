Return-Path: <koen@dominion.thruhere.net>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 74A51E0132F
	for <meta-ti@yoctoproject.org>; Tue,  6 Mar 2012 05:39:09 -0800 (PST)
Received: by wgbdq13 with SMTP id dq13so4197864wgb.11
	for <meta-ti@yoctoproject.org>; Tue, 06 Mar 2012 05:39:08 -0800 (PST)
Received: by 10.180.24.166 with SMTP id v6mr18730654wif.10.1331041148344;
	Tue, 06 Mar 2012 05:39:08 -0800 (PST)
Received: from [172.20.1.36] (ip545070eb.adsl-surfen.hetnet.nl.
	[84.80.112.235])
	by mx.google.com with ESMTPS id d7sm79039815wiz.6.2012.03.06.05.39.07
	(version=TLSv1/SSLv3 cipher=OTHER);
	Tue, 06 Mar 2012 05:39:07 -0800 (PST)
Mime-Version: 1.0 (Apple Message framework v1257)
From: Koen Kooi <koen@dominion.thruhere.net>
In-Reply-To: <4F5612AD.5040005@mlbassoc.com>
Date: Tue, 6 Mar 2012 14:39:03 +0100
Message-Id: <CA68B4BE-E86B-4EFA-B103-65B5B6DF5F39@dominion.thruhere.net>
References: <4F560422.8050405@mlbassoc.com>
	<CA+2YH7uxmj86FdEbqmbrOD-W1Rii09PRhDjJ8HhoW7t20wSWDg@mail.gmail.com>
	<4F5612AD.5040005@mlbassoc.com>
To: meta-ti@yoctoproject.org
X-Mailer: Apple Mail (2.1257)
X-Gm-Message-State: ALoCoQkydRyku3JgjUGPrwEbaW/NKQ82LG5ghksKY7kfvK1HxnaLfZeybQPgMYkw4TpY5nrAU5dx
Subject: Re: meta-ti vs meta-texasinstruments
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
X-List-Received-Date: Tue, 06 Mar 2012 13:39:09 -0000
Content-Type: text/plain; charset=us-ascii
Content-Transfer-Encoding: quoted-printable


Op 6 mrt. 2012, om 14:35 heeft Gary Thomas het volgende geschreven:

> On 2012-03-06 06:19, Enrico wrote:
>> On Tue, Mar 6, 2012 at 1:33 PM, Gary Thomas<gary@mlbassoc.com>  =
wrote:
>>> Why are there two layers, each seemingly providing support for
>>> TI products (boards, tools, etc)?  They have a great overlap,
>>> but many differences...
>>>=20
>>> Shouldn't there only be one such layer?  As is, the =
meta-texasinstruments
>>> one seems to be rather out of date, but I'm not sure.
>>=20
>> url of these layers? Maybe it's just an old reference in your setup
>> that is not getting updated (previously it was called
>> meta-texasinstruments and then it became meta-ti).
>=20
> Indeed, the meta-texasinstruments one may just be left over chaff.
>=20
> That said, where is u-boot-fw-utils (assuming not =
meta-texasinstruments)?

Hmm, let's look at the README and the layers it lists as requirements =
and take the first one, oe-core:

=
http://cgit.openembedded.org/openembedded-core/commit/?id=3D4a2543c0641f1d=
f6d74c18cfe0c3ac3cfd50e60c=


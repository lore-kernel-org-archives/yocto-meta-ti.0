Received: from yocto-www.yoctoproject.org (yocto-www.yoctoproject.org [140.211.169.56])
 by mx.groups.io with SMTP id smtpd.web12.2215.1580859799442481213
 for <meta-ti@lists.yoctoproject.org>;
 Tue, 04 Feb 2020 15:43:19 -0800
Authentication-Results: mx.groups.io;
 dkim=missing; spf=permerror, err=syntax error for token:  (domain: kernel.crashing.org, ip: 140.211.169.56, mailfrom: mark.hatle@kernel.crashing.org)
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id CDDA4E016B8; Tue,  4 Feb 2020 15:43:18 -0800 (PST)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.9 required=5.0 tests=BAYES_00 autolearn=ham
	version=3.3.1
X-Spam-HAM-Report: 
	* -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
X-Greylist: delayed 833 seconds by postgrey-1.32 at yocto-www; Tue, 04 Feb 2020 15:43:15 PST
Received: from kernel.crashing.org (kernel.crashing.org [76.164.61.194])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 21C9CE0166C;
	Tue,  4 Feb 2020 15:43:15 -0800 (PST)
Received: from Marks-MacBook-Pro-16.local ([76.164.61.198])
	(authenticated bits=0)
	by kernel.crashing.org (8.14.7/8.14.7) with ESMTP id 014NTFoV010966
	(version=TLSv1/SSLv3 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NO);
	Tue, 4 Feb 2020 17:29:15 -0600
Subject: Re: [meta-xilinx] addressing security in Yocto
To: "Minelik, Ben [US] (MS)" <Ben.Minelik@ngc.com>,
        "meta-freescale@yoctoproject.org" <meta-freescale@yoctoproject.org>,
        "meta-xilinx@lists.yoctoproject.org" <meta-xilinx@lists.yoctoproject.org>,
        "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
References: <3f190ec8540544b6a694b5f2cd089c30@XCGC3023.northgrum.com>
From: "Mark Hatle" <mark.hatle@kernel.crashing.org>
Cc: yocto-security@lists.yoctoproject.org
Message-ID: <9810cfed-d69d-1d0f-8982-ac0da1c28c4d@kernel.crashing.org>
Date: Tue, 4 Feb 2020 17:29:15 -0600
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:68.0)
 Gecko/20100101 Thunderbird/68.4.2
MIME-Version: 1.0
In-Reply-To: <3f190ec8540544b6a694b5f2cd089c30@XCGC3023.northgrum.com>
Content-Type: text/plain; charset=windows-1252
Content-Language: en-US
Content-Transfer-Encoding: quoted-printable

Security requires a holistic approach.  This can be divided into design and
defect response.

The design aspect of this is left to the implementer of the device.  Howev=
er, as
a project we need to do a better job at defining defaults, and looking for=
 items
like SCAP that can be used to help people design/implement more secure dev=
ices.

On the defect (security) response side, work is in progress on this.

Currently there is a script that will pull down CVE information and attemp=
t to
determine if a recipe may be affected based on specific CPE information.  =
But in
the end, this is a reactive approach that relies on other people to do ini=
tial
triage and assign the CPEs (and other information).

This means we really need more proactive, response approach.  The tooling =
for
this is nearly ready to go.  We have the security response tool (which is =
part
of the Yocto Project) designed to help us perform triage, and a small grou=
p of
us has been working on a process around to perform the triage.

In the near future, I will be trying to post to the yocto-security list tr=
iage
status and other issues we find.  When I begin posting, I will be inviting
people to help contribute to our triage, and response process.  (Currently=
 we're
running proof of concept triage behavior with a small group of people.)

--Mark

On 1/13/20 11:13 AM, Minelik, Ben [US] (MS) wrote:
> Good Morning,
>=20
> =A0
>=20
> I was wondering if there is a more holistic way we can address security =
in Yocto
> where we don=92t have to create scripts for each vulnerability?=A0 Is th=
ere anything
> in Yocto meta-security and buck-security that can assist with the harden=
ing of
> Yocto?
>=20
> =A0
>=20
> =A0
>=20
> =A0
>=20
> Thank you,
>=20
> =A0
>=20
> Ben
>=20
> Cybersecurity Engineer
>=20
> 720-975-5665
>=20
>=20
>=20
>=20

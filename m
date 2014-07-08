Return-Path: <chase.maupin@ti.com>
Received: by yocto-www.yoctoproject.org (Postfix, from userid 118)
	id 1BB7AE00559; Tue,  8 Jul 2014 08:32:56 -0700 (PDT)
X-Spam-Checker-Version: SpamAssassin 3.3.1 (2010-03-16) on
	yocto-www.yoctoproject.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.9 required=5.0 tests=BAYES_00,RCVD_IN_DNSWL_HI
	autolearn=ham version=3.3.1
X-Spam-HAM-Report: * -1.9 BAYES_00 BODY: Bayes spam probability is 0 to 1%
	*      [score: 0.0000]
	* -5.0 RCVD_IN_DNSWL_HI RBL: Sender listed at http://www.dnswl.org/,
	high *      trust
	*      [192.94.94.41 listed in list.dnswl.org]
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2A03FE00547
	for <meta-ti@yoctoproject.org>; Tue,  8 Jul 2014 08:32:43 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id s68FWYMQ021156;
	Tue, 8 Jul 2014 10:32:34 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id s68FWYnT030178;
	Tue, 8 Jul 2014 10:32:34 -0500
Received: from DLEE11.ent.ti.com ([fe80::40fa:b936:da7c:d113]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.03.0174.001; Tue, 8 Jul 2014 10:32:34 -0500
From: "Maupin, Chase" <chase.maupin@ti.com>
To: "Robert P. J. Day" <rpjday@crashcourse.ca>
Thread-Topic: [meta-ti] logicpd zoom am1808 experimenter kit versus am1809 evm?
Thread-Index: AQHPmjh+6jOFRPAHRkS2n/FoI5XoEJuWRJBwgABXYwD//7MJwA==
Date: Tue, 8 Jul 2014 15:32:34 +0000
Message-ID: <7D46E86EC0A8354091174257B2FED1015D121314@DLEE11.ent.ti.com>
References: <alpine.LFD.2.11.1407071749530.7024@localhost>
	<7D46E86EC0A8354091174257B2FED1015D120CD5@DLEE11.ent.ti.com>
	<alpine.LFD.2.11.1407081106170.6090@localhost>
In-Reply-To: <alpine.LFD.2.11.1407081106170.6090@localhost>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [128.247.5.50]
MIME-Version: 1.0
Cc: meta-ti mailing list <meta-ti@yoctoproject.org>
Subject: Re: logicpd zoom am1808 experimenter kit versus am1809 evm?
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
X-List-Received-Date: Tue, 08 Jul 2014 15:32:56 -0000
Content-Language: en-US
Content-Type: text/plain; charset="Windows-1252"
Content-Transfer-Encoding: quoted-printable

>-----Original Message-----
>From: Robert P. J. Day [mailto:rpjday@crashcourse.ca]
>Sent: Tuesday, July 08, 2014 10:07 AM
>To: Maupin, Chase
>Cc: meta-ti mailing list
>Subject: RE: [meta-ti] logicpd zoom am1808 experimenter kit versus
>am1809 evm?
>
>On Tue, 8 Jul 2014, Maupin, Chase wrote:
>
>> >-----Original Message-----
>> >From: meta-ti-bounces@yoctoproject.org [mailto:meta-ti-
>> >bounces@yoctoproject.org] On Behalf Of Robert P. J. Day
>> >Sent: Monday, July 07, 2014 5:04 PM
>> >To: meta-ti mailing list
>> >Subject: [meta-ti] logicpd zoom am1808 experimenter kit versus
>> >am1809 evm?
>> >
>> >
>> >  i have in front of me a logicpd zoom AM1808 eXperimenter kit:
>> >
>> >  http://www.logicpd.com/products/system-on-modules/zoom-
>am1808/
>> >
>> >and i notice that meta-ti has support for the am180x-evm, where
>> >the
>> >EVM is this beast:
>> >
>> >  http://www.logicpd.com/products/system-on-modules/zoom-
>am1808-
>> >evm/
>> >
>> >as best i can tell, the EVM is just the eXp kit with the added
>UI
>> >expansion board, would that be correct? so it seems that i can
>use
>> >the
>> >meta-ti layer and build for an am180x-evm to get a working
>system
>> >for
>> >my eXp kit, yes?
>>
>> I believe that will get you close.  But you may need to use
>dylan
>> branch as I think Dora and Daisy don't support this device well
>> anymore.
>
>  so i'm guessing that that particular processor is getting a bit
>dated, and has been superseded by ... what?

Closest is probably AM335x.  The issue from OE perspective is the older too=
lchain and kernel support.  You can still use it but you might want to use =
an internal toolchain, etc.

>
>rday
>
>--
>
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=3D=3D=3D=3D=3D=3D
>Robert P. J. Day                                 Ottawa, Ontario,
>CANADA
>                        http://crashcourse.ca
>
>Twitter:
>http://twitter.com/rpjday
>LinkedIn:
>http://ca.linkedin.com/in/rpjday
>=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
>=3D=3D=3D=3D=3D=3D


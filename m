Return-Path: <r-monk@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 405A7E003E4
	for <meta-ti@yoctoproject.org>; Fri, 24 Feb 2012 13:27:27 -0800 (PST)
Received: from dlep26.itg.ti.com ([157.170.170.121])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id q1OLRPVt015373;
	Fri, 24 Feb 2012 15:27:25 -0600
Received: from DNCE72.ent.ti.com (localhost [127.0.0.1])
	by dlep26.itg.ti.com (8.13.8/8.13.8) with ESMTP id q1OLROEf016954;
	Fri, 24 Feb 2012 15:27:25 -0600 (CST)
Received: from DNCE02.ent.ti.com ([fe80::e5b6:a692:b14:3c86]) by
	DNCE72.ent.ti.com ([fe80::8e3:61e5:a5b9:593c%23]) with mapi id
	14.01.0323.003; Fri, 24 Feb 2012 22:27:24 +0100
From: "Monk, Roger" <r-monk@ti.com>
To: Brian Hutchinson <b.hutchman@gmail.com>
Thread-Topic: [meta-ti]  bitbake ti-syslink fails for MACHINE=c6a816x
Thread-Index: AQHM8zqoYKMdkJ+mJEa0fGM95I4Y5ZZMj7tz
Date: Fri, 24 Feb 2012 21:27:23 +0000
Message-ID: <276E1D71-5358-40BF-8FE2-1653B28D5070@ti.com>
References: <CAFZh4h909x+Ckk2Fed-YtEyZ_YhKJQV82=RHV++AE1mdp3DFGw@mail.gmail.com>
	<CAFZh4h_DZVM0-P6VjiZd4Czqiq5UGppS1qRhg2G7sKR5W2n5aw@mail.gmail.com>
	<E95BAB41-4F4A-4A90-A975-FFD882EB41F3@ti.com>
	<CAFZh4h_NjvLfqjJfY6eMhESrNOubE5LWRqYwgnWxRndD=6w_qQ@mail.gmail.com>,
	<CAFZh4h-Vp=U-2fi9v6qEg43y6KFAkt2DQOS_Ev-2cvzXPWk8pw@mail.gmail.com>
In-Reply-To: <CAFZh4h-Vp=U-2fi9v6qEg43y6KFAkt2DQOS_Ev-2cvzXPWk8pw@mail.gmail.com>
Accept-Language: en-GB, en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-exclaimer-md-config: f9c360f5-3d1e-4c3c-8703-f45bf52eff6b
MIME-Version: 1.0
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: bitbake ti-syslink fails for MACHINE=c6a816x
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
X-List-Received-Date: Fri, 24 Feb 2012 21:27:27 -0000
Content-Language: en-GB
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

On 24 Feb 2012, at 21:24, "Brian Hutchinson" <b.hutchman@gmail.com> wrote:

> On Fri, Feb 24, 2012 at 4:21 PM, Brian Hutchinson <b.hutchman@gmail.com> =
wrote:
>> On Fri, Feb 24, 2012 at 4:07 PM, Monk, Roger <r-monk@ti.com> wrote:
>>> I don't think it is worth spending too much time debugging this, since =
this version of syslink is pretty old now and there will likely be further =
issues in this environment even if we can can get th build to complete, sin=
ce there are other related dependencies.  Best would be to look at adding t=
he version >=3D those versions that are used in DVSDK 5.03.  This is planne=
d, but we don't have a schedule at the moment.  If you have some time to he=
lp integrate these newer components it would be a big help.
>>>
>>> Thanks,
>>> ~roger
>>
> I just need to get syslink and sysbios going on C6A816x & L138.  We
> bitbake our rootfs image from Angstrom at the moment.  Can you advise
> the best way to get syslink/sysbios going on these two targets?  Our
> build machines a Linux based.  Should I be using the versions that are
> packaged inside the ezsdk .bin file?
>

Yes, that would be best to find a known good combination - however, if you =
are working with L138 as well, I could send you some prelim recipes and we =
could start with that, since the logic should be the same.  I'll dig that o=
ut for you.

> I can also help integrating but I might need some direction to get starte=
d.
>

No problem - thanks for the help with this.

> Regards,
>
> Brian
>
Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regist=
ered in England & Wales under company number 00574102

_______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti



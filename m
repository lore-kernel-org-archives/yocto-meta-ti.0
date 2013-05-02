Return-Path: <sallen@ti.com>
Received: from bear.ext.ti.com (bear.ext.ti.com [192.94.94.41])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 2C95FE01308
	for <meta-ti@yoctoproject.org>; Thu,  2 May 2013 11:45:12 -0700 (PDT)
Received: from dflxv15.itg.ti.com ([128.247.5.124])
	by bear.ext.ti.com (8.13.7/8.13.7) with ESMTP id r42IjAKJ008837;
	Thu, 2 May 2013 13:45:10 -0500
Received: from DLEE70.ent.ti.com (dlee70.ent.ti.com [157.170.170.113])
	by dflxv15.itg.ti.com (8.14.3/8.13.8) with ESMTP id r42IjA6x009719;
	Thu, 2 May 2013 13:45:10 -0500
Received: from DFLE08.ent.ti.com ([fe80::187f:8c86:2b7:ef9f]) by
	DLEE70.ent.ti.com ([fe80::c4c6:f618:54e7:ad11%28]) with mapi id
	14.02.0342.003; Thu, 2 May 2013 13:45:10 -0500
From: "Allen, Scott (ITS)" <sallen@ti.com>
To: Jon Szymaniak <jon.szymaniak+gpg@gmail.com>, "Dmytriyenko, Denys"
	<denys@ti.com>
Thread-Topic: [meta-ti] linux-ti-staging fetcher failures
Thread-Index: AQHOREx8k4m1WKGF7UievdnS3YvHHJjsyH6AgAV475A=
Date: Thu, 2 May 2013 18:45:09 +0000
Message-ID: <31331E6D91818F49B78B9920E96E64C704A3B444@DFLE08.ent.ti.com>
References: <CANge7vXRw==LjwWsXUL_sP1v05BGaGUPbr9K8HG4By6nON7kKw@mail.gmail.com>
	<20130428201051.GB11072@edge>
	<CANge7vXrkgrcOyn8Sn2wC5qXLOw2FwzVqW9QfOjs-tBLuirkxw@mail.gmail.com>
In-Reply-To: <CANge7vXrkgrcOyn8Sn2wC5qXLOw2FwzVqW9QfOjs-tBLuirkxw@mail.gmail.com>
Accept-Language: en-US
X-MS-Has-Attach: 
X-MS-TNEF-Correlator: 
x-originating-ip: [157.170.170.90]
MIME-Version: 1.0
X-Mailman-Approved-At: Thu, 02 May 2013 12:43:45 -0700
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: linux-ti-staging fetcher failures
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
X-List-Received-Date: Thu, 02 May 2013 18:45:12 -0000
Content-Language: en-US
Content-Type: text/plain; charset="us-ascii"
Content-Transfer-Encoding: quoted-printable

All, network team has identified a routing issue and made some corrections.=
 Initial testing indicates this resolved the problem.

Please try/ test again and let me know if the problem continues.

-scott


-----Original Message-----
From: jon.szymaniak@gmail.com [mailto:jon.szymaniak@gmail.com] On Behalf Of=
 Jon Szymaniak
Sent: Sunday, April 28, 2013 9:10 PM
To: Dmytriyenko, Denys
Cc: Allen, Scott (ITS); meta-ti@yoctoproject.org
Subject: Re: [meta-ti] linux-ti-staging fetcher failures

On Sun, Apr 28, 2013 at 4:10 PM, Denys Dmytriyenko <denys@ti.com> wrote:
> On Sun, Apr 28, 2013 at 01:50:55PM -0400, Jon Szymaniak wrote:
>> Hi all,
>>
>> I just wanted to inquire about the status of git.ti.com, which the=20
>> linux-ti-staging_3.8.bb recipe clones from.
>>
>> I've been trying to bring up my am335xevm, and have been constantly=20
>> getting timeouts from git.ti.com for the last few days.  I've had no=20
>> luck manually cloning the kernel from this server -- is this not publicl=
y accessible?
>
> Jon,
>
> Thanks for your inquiry! Unfortunately, I also noticed that git.ti.com=20
> was not accessible from outside since at least Friday. I will let our=20
> admins know, so they can take a look at the problem. Sorry for the inconv=
enience.
>
> --
> Denys

Thank you Denys!

FWIW, a friend of mine who's a couple miles away and on the same ISP is abl=
e to clone the kernel and visit the git web front-end.  Nothing jumped out =
at me when comparing our traceroute/tracepath results -- everything's large=
ly the same. I also see that ICMP seems blocked for me, but not for him.

Strange...let me know if I can provide any useful info.

- Jon


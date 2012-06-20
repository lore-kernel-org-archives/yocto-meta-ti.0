Return-Path: <jkridner@beagleboard.org>
Received: from mail-yx0-f176.google.com (mail-yx0-f176.google.com
	[209.85.213.176])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id 12702E01423
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:42:59 -0700 (PDT)
Received: by yenl5 with SMTP id l5so5698707yen.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:42:59 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=google.com; s=20120113;
	h=mime-version:in-reply-to:references:date:message-id:subject:from:to
	:cc:content-type:content-transfer-encoding:x-gm-message-state;
	bh=a8RjhD3IRaKp84l7HDJNFKr5MaBxs/6brL6ou3J0mh0=;
	b=XuINo1HT/DXCfXE7/lZtNcsB1ktatczDtN7FqOxyRy9JrzUVg/J063N2D+AAjMYwiR
	a1FS3MqFkFt6Xitsh8SASdpHj9fVlVD56RLi/4uDf/A7XraX+GYOm0JJkGz2gI6VWZC1
	8FMB1kMgZjOcPY6OlIB+OwJk2Qd7EKyynL/lLqE/5UBVzv8aJX0yD/0vVTPABJ5uP8AG
	o63c3hxY9g3zr98dY7+zDgI1EwqYDBTDadTXQg9BSzmKMXP98QJxwS6SWeWaScfKgNmZ
	AMTXRj3NAKCTMAflaGr6ib/Cr0jjyYMgR/InZeVkwA5Nyp7k3rhmHNqr8+rn/Fdfltwu
	CvCA==
Received: by 10.101.18.16 with SMTP id v16mr8078623ani.79.1340167379301;
	Tue, 19 Jun 2012 21:42:59 -0700 (PDT)
Received: from mail-ob0-f176.google.com (mail-ob0-f176.google.com
	[209.85.214.176])
	by mx.google.com with ESMTPS id c28sm52277229yhk.2.2012.06.19.21.42.58
	(version=SSLv3 cipher=OTHER); Tue, 19 Jun 2012 21:42:58 -0700 (PDT)
Received: by obbwd18 with SMTP id wd18so9285087obb.35
	for <meta-ti@yoctoproject.org>; Tue, 19 Jun 2012 21:42:58 -0700 (PDT)
MIME-Version: 1.0
Received: by 10.60.26.130 with SMTP id l2mr4914403oeg.49.1340167378143; Tue,
	19 Jun 2012 21:42:58 -0700 (PDT)
Received: by 10.182.227.74 with HTTP; Tue, 19 Jun 2012 21:42:58 -0700 (PDT)
In-Reply-To: <CADZ6=avUy_QP2E7cgDuU9redCXyb8JNzWhFhwMxXC10NiSSMYw@mail.gmail.com>
References: <20120612011706.GD30300@denix.org>
	<CADZ6=avUy_QP2E7cgDuU9redCXyb8JNzWhFhwMxXC10NiSSMYw@mail.gmail.com>
Date: Wed, 20 Jun 2012 00:42:58 -0400
Message-ID: <CA+T6QPkvE=AvpDOQJ4TR9ETadxWpyv0VVd4Z5eVVLNY2AxfymA@mail.gmail.com>
From: Jason Kridner <jkridner@beagleboard.org>
To: Thilo Fromm <fromm@dresearch-fe.de>
X-Gm-Message-State: ALoCoQlwZECneMIl54Ko25zQJMA6y+NGvEMIVG2RT3Ab2qdSZKaq/2BQUeKk3XZ1lDJzElagAZg3
Cc: meta-ti@yoctoproject.org
Subject: Re: RFC: creating "extras" layer
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
X-List-Received-Date: Wed, 20 Jun 2012 04:43:00 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jun 19, 2012 at 9:31 AM, Thilo Fromm <fromm@dresearch-fe.de> wrote:
> Hello Denys,
>
>> This is a RFC for creating an additional "extras" layer inside meta-ti t=
o
>> contain pieces and components that are either slightly outdated (i.e. ol=
d
>> Davinci boards, hawk/crane etc.) or have best-effort status (TI81x, anyt=
hing
>> DSP-related, etc.) or require non-standard dependencies besides OE-Core
>> (systemd?) with the possibility of moving them back to "main" meta-ti in=
 the
>> future, once they become "first-class citizens", i.e. gain current and
>> continuing support.
>
> Denys, did you just imply that ti81x has no current and continuing
> support? I'm just curious because our TI field application engineer
> keeps telling us that it is fully supported and will receive a kernel
> update soon.
>
> Can you please go into detail on what platforms will be supported in the =
future?
>
>> The initial split (which is still "work in progress"), following the abo=
ve
>> description (except the systemd for now) can be checked at:
>>
>> http://arago-project.org/git/?p=3Dmeta-ti.git;a=3Dshortlog;h=3Drefs/head=
s/split
>>
>> I do understand this is, like any other restructuring, an invasive chang=
e, but
>> is required to properly position "meta-ti" and the support behind it. I'=
m open
>> to a discussion and any constructive criticism - feel free to comment. T=
hanks.
>
> From a platform perspective your split makes a lot of sense imho.
> Especially if there is no active maintenance (let alone development)
> for the "extras" platforms. The euphemistic choice of naming puzzles
> me, though. I take it that by "extras" you actually mean "deprecated"
> or "unmaintained"? If so then please consider naming it that way.
> "extras" really suggests some added sugar to the "core" recipes of
> meta-ti, which doesn't really coin what you intend to do with it. If
> you need to be euphemistic please at least choose a name in the right
> context, like something along the lines of "attic", or "basement".

I believe this interpretation is a good reason not to make this split
at this time.  While I appreciate that some platforms will have more
resources given to updates at various times than others, I don't
believe this split generates an easy-to-grok understanding of the
platform status.  I'd suggest providing links to automated test
reports and something akin to a MAINTAINERS file for a better
indication of platform/recipe status/ownership.

>
> Regards,
> Thilo
>
> --
> Dipl.-Ing (FH) Thilo Fromm, MSc., Embedded Systems Architect
> DResearch Fahrzeugelektronik GmbH
> Otto-Schmirgal-Str. 3, D-10319 Berlin, Germany
> Tel: +49 (30) 515 932 228 =A0 mailto:fromm@dresearch-fe.de
> Fax: +49 (30) 515 932 77 =A0 =A0http://www.dresearch.de
> Amtsgericht: Berlin Charlottenburg, HRB 130120 B
> Ust.-IDNr. DE273952058
> Gesch=E4ftsf=FChrer: Dr. M. Weber, W. M=F6gle
> _______________________________________________
> meta-ti mailing list
> meta-ti@yoctoproject.org
> https://lists.yoctoproject.org/listinfo/meta-ti


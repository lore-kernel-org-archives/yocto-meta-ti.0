Return-Path: <ricardo@foundries.io>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A3E7C54EAA
	for <webhook@archiver.kernel.org>; Mon, 30 Jan 2023 18:28:07 +0000 (UTC)
Received: from mail-lj1-f179.google.com (mail-lj1-f179.google.com [209.85.208.179])
 by mx.groups.io with SMTP id smtpd.web10.1839.1675103278572989953
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 30 Jan 2023 10:27:59 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@foundries.io header.s=google header.b=QjpOARDv;
 spf=pass (domain: foundries.io, ip: 209.85.208.179, mailfrom: ricardo@foundries.io)
Received: by mail-lj1-f179.google.com with SMTP id u27so6898941ljo.12
        for <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 10:27:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=foundries.io; s=google;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=TRy0cTAKlf4Z3AsXj0qOwxBYPWLEE8lTox+8hQaHamA=;
        b=QjpOARDv6c2Q4JCIvnzS9ZWD3fTmhLW7KM25mjGtG8eVEsqV5n9GwumOqLtyokU81l
         AhygP7pGQK3eduGQXcggRqyiFW0WV3FoUOOoFPQGbDFHqcRhYh8wXtnZZqv/PA1pVgep
         0hoCtH0+EckmJ9bdEzWr0C2yk+DnZi+aeW4AB7OOI/qm7KMnWn4DuJ5xAuXjpR+61/RR
         XMjmnkoeo2jtQEBInEpmol+BfysTqzdJxd+VeQhAwIpdQRDf7BLMqU9P2lJhz5ud5WKe
         Hgvtz7aYlr6hTrM0r7hhcXGtB75NniFqJ3Pi/np9HvTy3x0Bjtgn6j4xloAhjlQ3BCWF
         a8hA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TRy0cTAKlf4Z3AsXj0qOwxBYPWLEE8lTox+8hQaHamA=;
        b=uTOW1tiW3bpqI/YF1wN4iKDgTt9ug4j3L8WhJ06YcXo/IMUpKvwfF2/UbxMrXUxBIr
         dhKgJYKZz59lJy6GM93p1Z5N4Pxeli0z44nkj3QM8c9A3AFEWhXSay3gWJa825RQ98aL
         AZdqs5PAIBmHLIJBhCwJt76BsXAkdPC7+QzkNKR5O8+1dRi/+qs+yvYpYxMcWpqtE9sT
         Fiz1vC8fygT9yCHxAmTHvv/rC5fU0kpMb423hnH4a2BMQtnsHamghBX5t4RltXp9H3a/
         VVtYvanGTZwI6GtHfh2bPAvykYpZO2m30dAPGlv90PbKTjJEQpedlATg+pmKWyGXagkc
         JZoA==
X-Gm-Message-State: AO0yUKWolfzoUpK4B3qjOmR19GJefQXCOphVbfe8MutycIYmxMRnZOh6
	GD25q/brIGjW8d9/jqcizokneqDy1ocKAYEDbKCI
X-Google-Smtp-Source: AK7set/CO2rSjfVqIBBhU7e1Dno+jXvxAC8LIY3lsxVv99PyK6xhWvqcXI0d52555M6WI+g0D1LWyAvAzFNaMGyzDX4=
X-Received: by 2002:a2e:b171:0:b0:290:4dca:4eac with SMTP id
 a17-20020a2eb171000000b002904dca4eacmr1611951ljm.139.1675103276702; Mon, 30
 Jan 2023 10:27:56 -0800 (PST)
MIME-Version: 1.0
References: <20230130152000.705123-1-jose.quaresma@foundries.io>
 <74d5bfd6-556b-6194-ca78-771d86509e5f@ti.com> <20230130171811.GJ22689@denix.org>
 <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
In-Reply-To: <CANPvuR=x6wZ7x1kPndVuWtSTgy12+wUyw4zpzZ7SgP-OPms4Qg@mail.gmail.com>
From: Ricardo Salveti <ricardo@foundries.io>
Date: Mon, 30 Jan 2023 15:27:19 -0300
Message-ID: <CAAaKDhGj8oTZ-j-gnTfHs5Ra3d3qAYbgiSR+5YYzcvJ+wKiQXQ@mail.gmail.com>
Subject: Re: [meta-ti][master/kirkstone][PATCH] bsp: multiconfig: k3r5: allow
 customization by donwstream layers
To: Jose Quaresma <quaresma.jose@gmail.com>
Cc: Denys Dmytriyenko <denis@denix.org>, reatmon@ti.com, meta-ti@lists.yoctoproject.org, 
	Jose Quaresma <jose.quaresma@foundries.io>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from li982-79.members.linode.com [45.33.32.79] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 30 Jan 2023 18:28:07 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/15704

On Mon, Jan 30, 2023 at 2:57 PM Jose Quaresma <quaresma.jose@gmail.com> wro=
te:
> Denys Dmytriyenko <denis@denix.org> escreveu no dia segunda, 30/01/2023 =
=C3=A0(s) 17:18:
>>
>> On Mon, Jan 30, 2023 at 11:02:25AM -0600, Ryan Eatmon via lists.yoctopro=
ject.org wrote:
>> >
>> >
>> > On 1/30/2023 9:20, Jose Quaresma wrote:
>> > >This patch adds the possibility to change some bitbake variable
>> > >that cannot be changed anywhere else, one of then is the TMPDIR.
>> > >
>> > >Using the same TMPDIR it is very sensitive and prone to several error=
s
>> > >when used in more complex situations.
>> > >This configuration forces that all native packages have to be the sam=
e between all
>> > >machines and this requirement is very easy to break.
>> > >Suppose you use a macinhe override somewhere on a native recipe
>>
>> Even w/o multiconfig, this will break for multi-machine builds. Native
>> packages are for the build host and have no knowledge about the target.
>> You should probably look into cross packages instead of native ones for
>> this use case.
>>
>> Altering native packages between different targets will cause them to
>> rebuild, which they shouldn't. Moreover, it will mess up your sstate
>> and lead to weird issues down the road when trying to re-use your
>> sstate mirror/cache.
>
> Is that the issue of rebuilding some native packages that I am trying to =
avoid.
> But it is very hard to fix this in OE-core and everything else layers wha=
t happens.
>
> For your information I have some other issues with multiconfig and native=
 packages
> that have the source files provided on the layer. this two recipes don't =
work with the
> rm_work bbclass because the in one of the machines
> texinfo-dummy-native gettext-minimal-native
>
> Another issue is that sometimes one of the machines uses the SOURCE_DATE_=
EPOCH_FALLBACK
> and the other uses  SOURCE_DATE_EPOCH and this also triggers a rebuild of=
 one of the machines.
>
> Recently a new issue with the rm_work and the spdx
> comes in https://lists.openembedded.org/g/openembedded-core/message/17427=
6
> where I have the steps to reproduce.
>
> All of these issues can be solved easily with TMDIR for each machine,
> but because I understand it can be invasive I submit this patch that does=
n't change anything
> in meta-ti but can add the possibility to use a different TMPDIR for each=
 machine.
>
> A different TMPDIR for each machine is also referenced in the official do=
cumentation
> "Minimally, each configuration file must define the machine and the tempo=
rary directory BitBake uses for the build. Suggested practice dictates that=
 you do not overlap the temporary directories used during the builds."
> https://docs.yoctoproject.org/bitbake/bitbake-user-manual/bitbake-user-ma=
nual-intro.html#executing-a-multiple-configuration-build
>
>> > >and this requirement is no longer met.
>> > >Many of these anomalies can be verified with the use of the rm_work a=
nd
>> > >create-spdx bitbake classes.
>> > >
>> > >A previous attempt [1] had already been made but was refused
>> > >but this way it can be done without side effects for other users.
>> > >
>> > >[1] https://lists.yoctoproject.org/g/meta-ti/message/14767
>> >
>> >
>> > So the difference between this patch and the previous one, is that
>> > you are now included a file that is not there normally so that you
>> > can put the contents of the previous patch in the new include file
>> > to get around the issue in the archiver.
>
> The archiver issue is fixed but it will be very easy to break again.
> Myself recently broke it again so I added a test to help there
> https://git.yoctoproject.org/poky/commit/?id=3Db5baa7dc8bd1c0d2d78c532d97=
a44120346b5edd
>
>> >
>> > I'm not saying I'm opposed to this approach (yet), I'm just trying
>> > to understand the entire story.
>> >
>> > Did you find anything in looking at fixing the archiver to better
>> > support the multi-config issue?
>
> The issue now is different and is related with spdx and rm_work
> https://lists.openembedded.org/g/openembedded-core/message/174276
>
> With this patch I can set a new TMPDIR folder for each machine and
> can build successfully.

If you don't have spdx enabled then these sort of issues happen less
often, but after the above patch was merged in oe-core (and also
backported to kirkstone), we cannot build multiconfig targets from
meta-ti anymore with spdx enabled.

This is special to spdx because of the way the task dependencies are
done, which requires it to be executed before rm_work. This is OK when
a machine specific TMPDIR is used and explodes quite quickly (due
races) when sharing TMPDIR because of the parallel rm_work tasks that
end up removing stuff that is still required by other parallel tasks.

Cheers,
--=20
Ricardo Salveti


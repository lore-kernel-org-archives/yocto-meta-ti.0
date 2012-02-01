Return-Path: <pabigot@gmail.com>
Received: from mail-ww0-f54.google.com (mail-ww0-f54.google.com [74.125.82.54])
	by yocto-www.yoctoproject.org (Postfix) with ESMTP id D5671E004D2
	for <meta-ti@yoctoproject.org>; Wed,  1 Feb 2012 12:41:27 -0800 (PST)
Received: by wgbdq12 with SMTP id dq12so1701950wgb.11
	for <meta-ti@yoctoproject.org>; Wed, 01 Feb 2012 12:41:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=gmail.com; s=gamma;
	h=mime-version:sender:in-reply-to:references:date
	:x-google-sender-auth:message-id:subject:from:to:cc:content-type
	:content-transfer-encoding;
	bh=ETcY5SYaaq2YXk317b2CHUji/16MUg0Q3svtfUWHo5E=;
	b=CDppmGRpOcPIltIyjKRAL+WmQnNcbeJqjl2SG6cVJlPRA8FVfvzMeaq8MNmeO1crX6
	Etg3xbYiG2qHIXgYSBrjd8E29kr14KqDkHg4sBWBZXC23GP7LpNC1g1m2HyQ84CLq+2q
	Dz6GWrbGcvsTUJ765FNooWSu/ctuLc5XL2Ae4=
MIME-Version: 1.0
Received: by 10.180.19.97 with SMTP id d1mr154652wie.12.1328128886489; Wed, 01
	Feb 2012 12:41:26 -0800 (PST)
Sender: pabigot@gmail.com
Received: by 10.216.51.69 with HTTP; Wed, 1 Feb 2012 12:41:26 -0800 (PST)
In-Reply-To: <4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
References: <1328013657-2069-1-git-send-email-bigotp@acm.org>
	<4C82F39BABFE6A429733A300DEBF52240B5AC841@DNCE02.ent.ti.com>
Date: Wed, 1 Feb 2012 14:41:26 -0600
X-Google-Sender-Auth: xjqqKalW5d3j_E9J-2wsSFwkTS4
Message-ID: <CAPOJ94NTu_TMaJ_hYOvtpHmJDyQyfOythjYRtBukCeUKYgtFOw@mail.gmail.com>
From: Peter Bigot <bigotp@acm.org>
To: "Monk, Roger" <r-monk@ti.com>
Cc: "meta-ti@yoctoproject.org" <meta-ti@yoctoproject.org>
Subject: Re: [PATCH 0/4] Resubmit TI DSP build issues related to installer
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
X-List-Received-Date: Wed, 01 Feb 2012 20:41:28 -0000
Content-Type: text/plain; charset=ISO-8859-1
Content-Transfer-Encoding: quoted-printable

On Tue, Jan 31, 2012 at 6:45 PM, Monk, Roger <r-monk@ti.com> wrote:
> Hi Peter,
>
> On Tue, Jan 31, 2012 at 12:40:53, Peter A. Bigot wrote:
>> Subject: [meta-ti] [PATCH 0/4] Resubmit TI DSP build issues related to
>> installer
>>
>> From: "Peter A. Bigot" <bigotp@acm.org>
>>
>> This patch set re-submits the (updated) uncommitted parts of my
>> 27Dec2011 patch set to get gstreamer-ti and its dependencies to build
>> in a pristine work environment. =A0It was left back on 29Dec2011 with:
>>
>> > I'm going to wait for Roger to get back from holidays to comment on
>> the installer issues, I'll push the CE and dmai patches later today.
>>
>
> Thanks for re-basing/re-submitting - sorry this has taken a while. =A0You=
r patches look good - however, I have some other failing installer scenario=
s like these for which I have a similar, but unfortunately, not the same pa=
tchset, in progress. =A0I hope to review yours in the coming days if ok.

That's fine.  Rather than bug everybody with update emails while the
two approaches are reconciled, these fixes are available at
https://github.com/pabigot/meta-ti/tree/ti-eula-unpack.  There you'll
find the corresponding change as required for omap3-sgx-modules.

Peter

>> The installer issues are:
>>
>> ti-eula-unpack spawns the installer, then writes canned input to it to
>> do things like set the output directory. =A0The function that does this
>> explicitly tacks a second newline on, in addition to the one normally
>> added by Python's print statement.
>>
>> For ti-cgt6x, the result is that a bare newline is fed to the
>> installer at the point where the installation directory is requested,
>> instead of the workdir. =A0Hence, the default directory gets used; for
>> this package, that's in /opt/TI.
>>
>> For ti-xdctools, ti-edma3lld, and ti-dspbios, the bare newline also
>> caused the default installation directory to be requested, but for
>> this package that's ${HOME}/ti. =A0Since ti-eula-unpack overrides the
>> HOME environment variable to be the work directory, everything somehow
>> happened to work out, at least for other folks. =A0I don't think that's
>> a great solution though, so I updated the recipes to do it "right", by
>> changing the commands to conform to what the current installers expect.
>> There may be other installation recipes for other tools that need the
>> same fixes.
>>
>> For the 31Jan2012 attempt, similar changes had to be made to
>> ti-codecs- omap3530.
>>
>> For the 31Jan2012 attempt, the ti-dmai build required more than just
>> altering the striplevel: the ${S} value had to be changed since there
>> was no Makefile at its original value. =A0There is still an issue that
>> prevents use of where make 3.85 produces a "Entering an unknown
>> directory" failure in do_install, but that's an upstream problem: I
>> just used make 3.81 to complete the build.
>>
>> Peter A. Bigot (4):
>> =A0 ti-eula-unpack: remove extraneous newline in cmd output
>> =A0 various: fix installation directories for corrected ti-eula-unpack
>> =A0 ti-codecs-omap3530: fix for corrected ti-eula-unpack
>> =A0 ti-dmai_svn: correct path within svn checkout
>>
>> =A0recipes-ti/bios/ti-dspbios.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A03 ++-
>> =A0.../codec-engine/ti-codecs-omap3530_4.00.00.00.bb =A0| =A0 20 +++++++=
+++--
>> --------
>> =A0recipes-ti/devtools/ti-xdctools.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 ++-
>> =A0recipes-ti/dmai/ti-dmai_svn.bb =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0 =
=A0 | =A0 =A09 ++++++---
>> =A0recipes-ti/edma3lld/ti-edma3lld.inc =A0 =A0 =A0 =A0 =A0 =A0 =A0 =A0| =
=A0 =A03 ++-
>> =A0recipes-ti/includes/ti-eula-unpack.inc =A0 =A0 =A0 =A0 =A0 =A0 | =A0 =
=A02 +-
>> =A06 files changed, 23 insertions(+), 17 deletions(-)
>>
>> --
>> 1.7.6.4
>>
>>
> Texas Instruments Limited, 800 Pavilion Drive, Northampton, NN4 7YL. Regi=
stered in England & Wales under company number 00574102
>
> _______________________________________________
>> meta-ti mailing list
>> meta-ti@yoctoproject.org
>> https://lists.yoctoproject.org/listinfo/meta-ti
>
>
>


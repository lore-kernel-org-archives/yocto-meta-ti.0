Return-Path: <jcormier@criticallink.com>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2735BEB362C
	for <webhook@archiver.kernel.org>; Mon,  2 Mar 2026 18:35:47 +0000 (UTC)
Received: from mail-yx1-f47.google.com (mail-yx1-f47.google.com [74.125.224.47])
 by mx.groups.io with SMTP id smtpd.msgproc01-g2.167798.1772476538159262926
 for <meta-ti@lists.yoctoproject.org>;
 Mon, 02 Mar 2026 10:35:38 -0800
Authentication-Results: mx.groups.io;
 dkim=pass header.i=@criticallink.com header.s=google header.b=aKrVj7bE;
 spf=pass (domain: criticallink.com, ip: 74.125.224.47, mailfrom: jcormier@criticallink.com)
Received: by mail-yx1-f47.google.com with SMTP id 956f58d0204a3-64cb577e79cso4812454d50.0
        for <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 10:35:37 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1772476537; cv=none;
        d=google.com; s=arc-20240605;
        b=Fbf5tEHL64akhUYnnx8Kg12gcFeL4wZ6FuoMZNCNQ4FNN6oOaIWDQHO3VqauKMRqMV
         6ukpaF+U/vCgNMSe245Hn5F2dScgAf1uUpAwHtmlZBHXpjRD5UHBU3SDJDKtxDBZKfn9
         HKCQJcdVEvAcLvYXrWa1+x+fKeJefjGYtAdXX+w8GtWBcqXdSphdRqP9QKOm8hCvzBPS
         bdA3SDp6Iv7TO+fpGVVCgyYTGhUJsE6hQFgQr3c0aOYpZloqzoZKWCH2nf96dC6mkNi7
         UmYiGDfdrqwwgZ82Q9eK7ZhAHCxfW4HBqDYTrZI6kdjcSBVW9B0RJ/QiK9NszTrqYjyp
         mFuA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=/gjEttXZmKbl2BXkyA3yf7cCp/oL/KvhNeHfmC6Icy8=;
        fh=qASoX7qEr1p43+br0pzCRAt+uEQjZq7xeb1GchTdhh4=;
        b=VbzHVARyMIysWmmEGI+3klCMUfTR83ScD6+vWcQK15cw6JgK3OEix3mTg/AivVcqC2
         oEDJWfJim3xnEe6F3CjoVPbUXcHjl3ZyfX4a3230OWFpimN81Z4R3fhfMwdLcC/ByyCq
         1U++vlueS1TJaE0BxNIj8jrTBOig/QwxSnuKiphE03XSEQmHqskIJ18aXY50O4+PEZXx
         VqQJkEBaLt1T36ZIdrYj5NvtO05M8h1vWd/yYL+Do1FAsdaBA8RV4bOOxwX+3GeL8pnK
         NfiHdySytdlZVJ0fjQ/pyKwP0MUrU0bkepmjV0LnK3L9LOtDJF+1ftGTfDIMuGTE1uDc
         hncg==;
        darn=lists.yoctoproject.org
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=criticallink.com; s=google; t=1772476537; x=1773081337; darn=lists.yoctoproject.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/gjEttXZmKbl2BXkyA3yf7cCp/oL/KvhNeHfmC6Icy8=;
        b=aKrVj7bEiTtBBKWeu6NDc+c2qLFFRs5pEFKreSBOIZ8upMg0V6OigDeg21t1kMJKBU
         mTKQfONPedR4989FpijPoQwu6PY8m6TgVUa5OrhmPjIGXAb2kLm8GQc00/cwqzrx1M44
         Sc4tNu5BIOBeajxx2czTnb8s9igXuOfko3ec0dQBlrzBjNj2TIP7JFWCjT4Xgq6IcRDd
         TmzLjP3iK9jDQa7AHoPLw3eQD/Uc557qTz9ZP26Qts34UpiC9Zk7PXlH01pv5tqgKj+O
         W2KHAPt3MfOMyuw+JDSL+ZqAPC6P0C6wczaElgwVfYWWt9UyGdMOF9+mZnsecbszj4t/
         IZkw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772476537; x=1773081337;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=/gjEttXZmKbl2BXkyA3yf7cCp/oL/KvhNeHfmC6Icy8=;
        b=QN+5kqnXWs4VES5MK1i+JnvyeaOUEP7SKLoSDQfH81RzwfrxhC3LdZWR6WNndBCxeq
         D9Yhf3au4NfARxWEpFagDRMkOGZbAqqgBoRO1hGrFGDNWFxeWCrm/53R29bocGatQfXG
         wKws3n/L3XxZ+f06uA8L6RK5fwAr0ciKusRfRlpQqJVbiZUuGdjfD48GAW5l50YPg2uw
         HMhyUDoKTT8UtvfTkf3URVGPUMh9bY/aU7TKuzsk/i83peG21TlorEF3FI6HvbrdtDP2
         QJkI4NZXYYt3pzR9XLPkFK9A3sePzZbcx6KtTlwR4jh+jarl3+acklwtfuJBMIYl7RTm
         bY4w==
X-Gm-Message-State: AOJu0YwXRwp3VDLsvrIekLhxwUrezYGvNa3yZ/hyfs75tPBMemwL2O7Y
	BQ353PRumFap5HQIhue/SENIxjaEBGo0Z/LnD39hKLDeToGslPnVT4qMUIZ2bR+duXSYjikb6rV
	G+PwVS4FU18JL2d4/SvwviKY62p3x2nAv88nkMBXk
X-Gm-Gg: ATEYQzzw6pdtGYbi6qTxuxF16tZrANhXNShxv7tnwNhIvVk1oZU3FcfQufluVbni5p7
	QVOm9WOndN7u4MZVxql0acCROFShL481LqLxHo4pjxJvV6MXw4HuqjIzWPrHe8LEtcbHcVQaDla
	2l9ZwGmF6TNB5na+bfzXBA6hj1hgWJPvE2Hin4/zJTwQjKLYCotu1IproRPJVcM8BhxwG9Q4ti8
	EEHUQhTRrgF0loT3hZVPqzzZfs8ifOLIq9158Uiz4DBj6aM/Bb6BeVw5fWqSY5vEA1pLzPyj6ne
	Bk4PeA==
X-Received: by 2002:a53:ee65:0:b0:649:b4cd:b539 with SMTP id
 956f58d0204a3-64cc20e44c6mr8693039d50.35.1772476536834; Mon, 02 Mar 2026
 10:35:36 -0800 (PST)
MIME-Version: 1.0
References: <20260302144647.1705408-1-s-tripathi1@ti.com> <20260302144647.1705408-3-s-tripathi1@ti.com>
In-Reply-To: <20260302144647.1705408-3-s-tripathi1@ti.com>
From: Jon Cormier <jcormier@criticallink.com>
Date: Mon, 2 Mar 2026 13:35:25 -0500
X-Gm-Features: AaiRm51xhilCr2YRrGltYoyfFCjCxAsfvafVX_ne6vHXjlI8r1GPka4fIu1hDOI
Message-ID: <CADL8D3ZKtJt_jrD55r9mU0rqr3bG0SEsX0BKu0_HiuCSA0haag@mail.gmail.com>
Subject: Re: [meta-ti][master][PATCH 2/3] initramfs: Add encrypted boot
 support with fTPM
To: s-tripathi1@ti.com
Cc: meta-ti@lists.yoctoproject.org, reatmon@ti.com, praneeth@ti.com, 
	kamlesh@ti.com, vishalm@ti.com, k-malarvizhi@ti.com
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
List-Id: <meta-ti.lists.yoctoproject.org>
X-Webhook-Received: from 45-33-107-173.ip.linodeusercontent.com [45.33.107.173] by
 aws-us-west-2-korg-lkml-1.web.codeaurora.org with HTTPS for
 <meta-ti@lists.yoctoproject.org>; Mon, 02 Mar 2026 18:35:47 -0000
X-Groupsio-URL: https://lists.yoctoproject.org/g/meta-ti/message/19631

Is there some odd initramfs limitation that requires explicitly
calling out /usr/bin/busybox throughout the whole script?

Surely echo atleast can be relied on to be built into the shell or PATH.


On Mon, Mar 2, 2026 at 12:07=E2=80=AFPM Shiva Tripathi via
lists.yoctoproject.org <s-tripathi1=3Dti.com@lists.yoctoproject.org>
wrote:
>
> Add ti-encrypted-boot-initramfs for LUKS encryption with TPM-sealed
> keys. This provides full disk encryption using dm-crypt with keys
> sealed by firmware TPM (fTPM) running in OP-TEE and stored in eMMC RPMB.
>
> The initramfs includes:
> - Custom init script for in-place LUKS encryption on first boot
> - TPM key sealing/unsealing using persistent handle 0x81080001
> - Support for cryptsetup, tpm2-tools, and OP-TEE client
> - Automatic filesystem resize after encryption
>
> ti-encrypted-boot-initramfs builds when MACHINE_FEATURES contains
> 'luks-encryption'.
>
> Signed-off-by: Shiva Tripathi <s-tripathi1@ti.com>
> ---
>  .../initramfs-ti-encrypted-init/files/init    | 324 ++++++++++++++++++
>  .../initramfs-ti-encrypted-init_1.0.bb        |  30 ++
>  .../initramfs/ti-encrypted-boot-initramfs.bb  |  50 +++
>  3 files changed, 404 insertions(+)
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypt=
ed-init/files/init
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypt=
ed-init_1.0.bb
>  create mode 100644 meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-in=
itramfs.bb
>
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init=
/files/init b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/=
files/init
> new file mode 100644
> index 00000000..6675b6ed
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init/files/=
init
> @@ -0,0 +1,324 @@
> +#!/usr/bin/busybox sh
> +# TI SDK initramfs init script with LUKS2 + fTPM encryption support
> +
> +# Mount essential filesystems
> +/usr/bin/busybox echo "Initializing system..."
> +/usr/bin/busybox mount -t proc proc /proc
> +/usr/bin/busybox mount -t sysfs sysfs /sys
> +/usr/bin/busybox mount -t devtmpfs devtmpfs /dev
> +
> +# Configuration
> +BOOT_DEV=3D"/dev/mmcblk1p1"           # Boot partition (FAT, unencrypted=
)
> +ROOT_DEV=3D"/dev/mmcblk1p2"           # Root partition (will be encrypte=
d)
> +CRYPT_NAME=3D"root_crypt"
> +CRYPT_DEV=3D"/dev/mapper/${CRYPT_NAME}"
> +BOOT_MNT=3D"/boot_part"
> +TPM_PRIMARY_CTX=3D"/tmp/tpm_primary.ctx"
> +TPM_KEY_PRIV=3D"/tmp/tpm_key.priv"
> +TPM_KEY_PUB=3D"/tmp/tpm_key.pub"
> +TPM_KEY_CTX=3D"/tmp/tpm_key.ctx"
> +TPM2_HANDLE=3D"0x81080001"            # TPM persistent handle for LUKS k=
ey
> +ENCRYPTION_MARKER=3D"${BOOT_MNT}/.encryption_in_progress"
> +
> +# Wait for MMC device to appear (up to 10 seconds)
> +/usr/bin/busybox echo "Waiting for storage device..."
> +for i in 1 2 3 4 5 6 7 8 9 10; do
> +    if [ -b "${ROOT_DEV}" ]; then
> +        break
> +    fi
> +    /usr/bin/busybox sleep 1
> +done
> +
> +# Check if root device exists
> +if [ ! -b "${ROOT_DEV}" ]; then
> +    /usr/bin/busybox echo "ERROR: Storage device not found!"
> +    /usr/bin/busybox sh
> +fi
> +
> +# Mount boot partition
> +/usr/bin/busybox echo "Mounting boot partition..."
> +/usr/bin/busybox mkdir -p "${BOOT_MNT}"
> +if ! /usr/bin/busybox mount "${BOOT_DEV}" "${BOOT_MNT}"; then
> +    /usr/bin/busybox echo "ERROR: Failed to mount boot partition!"
> +    /usr/bin/busybox echo "Attempting standard boot..."
> +    /usr/bin/busybox mkdir -p /newroot
> +    /usr/bin/busybox mount "${ROOT_DEV}" /newroot
> +    exec /usr/sbin/switch_root /newroot /sbin/init
> +fi
> +
> +# Initialize fTPM in OP-TEE
> +/usr/bin/busybox echo "Initializing secure hardware(fTPM)..."
> +
> +# Start TEE supplicant (required for fTPM TA to work)
> +if [ -x /usr/sbin/tee-supplicant ]; then
> +    /usr/sbin/tee-supplicant -d &
> +    TEE_SUPPLICANT_PID=3D$!
> +    /usr/bin/busybox sleep 5
> +else
> +    /usr/bin/busybox echo "Warning: Trusted execution environment not av=
ailable"
> +fi
> +
> +# Load fTPM kernel module
> +if ! /sbin/modprobe tpm_ftpm_tee; then
> +    /usr/bin/busybox echo "Warning: TPM module failed to load"
> +fi
> +
> +# Wait for TPM device (up to 10 seconds)
> +for i in 1 2 3 4 5 6 7 8 9 10; do
> +    if [ -c /dev/tpmrm0 ]; then
> +        break
> +    fi
> +    /usr/bin/busybox sleep 1
> +done
> +
> +# Check if TPM is available
> +TPM_AVAILABLE=3D0
> +if [ -c /dev/tpmrm0 ]; then
> +    TPM_AVAILABLE=3D1
> +    export TPM2TOOLS_TCTI=3D"device:/dev/tpmrm0"
> +else
> +    /usr/bin/busybox echo "Warning: fTPM not available - encryption will=
 be skipped"
> +    if [ -n "${TEE_SUPPLICANT_PID}" ]; then
> +        /usr/bin/busybox kill "${TEE_SUPPLICANT_PID}" 2>/dev/null
> +    fi
> +fi
> +
> +# Function: Generate 32-byte random key using TPM RNG
> +generate_random_key() {
> +    if [ $TPM_AVAILABLE -eq 1 ]; then
> +        /usr/bin/tpm2_getrandom --hex 32
> +    else
> +        /usr/bin/busybox echo "ERROR: TPM not available for key generati=
on"
> +        return 1
> +    fi
> +}
> +
> +# Function: Seal data with TPM and store in persistent handle
> +tpm_seal_key() {
> +    local KEY_DATA=3D"$1"
> +
> +    if [ $TPM_AVAILABLE -eq 0 ]; then
> +        /usr/bin/busybox echo "ERROR: TPM not available for sealing"
> +        return 1
> +    fi
> +
> +    # Create primary key in owner hierarchy
> +    /usr/bin/tpm2_createprimary -C o -c "${TPM_PRIMARY_CTX}" -Q || retur=
n 1
> +
> +    # Create sealed object
> +    /usr/bin/busybox echo -n "${KEY_DATA}" | \
> +        /usr/bin/tpm2_create -C "${TPM_PRIMARY_CTX}" \
> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
> +        -i- -Q || return 1
> +
> +    # Load sealed object into TPM
> +    /usr/bin/tpm2_load -C "${TPM_PRIMARY_CTX}" \
> +        -u "${TPM_KEY_PUB}" -r "${TPM_KEY_PRIV}" \
> +        -c "${TPM_KEY_CTX}" -Q || return 1
> +
> +    # Make key persistent at handle (stored in TPM NV RAM - RPMB)
> +    /usr/bin/tpm2_evictcontrol -C o -c "${TPM_KEY_CTX}" "${TPM2_HANDLE}"=
 || return 1
> +
> +    return 0
> +}
> +
> +# Function: Unseal data from TPM persistent handle
> +tpm_unseal_key() {
> +    if [ $TPM_AVAILABLE -eq 0 ]; then
> +        /usr/bin/busybox echo "ERROR: TPM not available for unsealing" >=
&2
> +        return 1
> +    fi
> +
> +    # Check if persistent handle exists
> +    if ! /usr/bin/tpm2_getcap handles-persistent | grep -q "${TPM2_HANDL=
E}"; then
> +        /usr/bin/busybox echo "ERROR: TPM persistent handle not found" >=
&2
> +        return 1
> +    fi
> +
> +    # Unseal key directly from persistent handle
> +    /usr/bin/tpm2_unseal -c "${TPM2_HANDLE}" || return 1
> +
> +    return 0
> +}
> +
> +# Function: Perform in-place LUKS encryption (first boot)
> +encrypt_root_filesystem() {
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "First boot: Encrypting root filesystem"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    # Set marker to track encryption progress
> +    /usr/bin/busybox touch "${ENCRYPTION_MARKER}"
> +    /usr/bin/busybox sync
> +
> +    # Generate random encryption key using TPM RNG
> +    /usr/bin/busybox echo "Generating encryption key..."
> +    LUKS_KEY=3D$(generate_random_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        /usr/bin/busybox echo "ERROR: Failed to generate encryption key"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Seal key with TPM before encryption starts
> +    /usr/bin/busybox echo "Securing key with TPM..."
> +    if ! tpm_seal_key "${LUKS_KEY}"; then
> +        /usr/bin/busybox echo "ERROR: Failed to secure key"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Filesystem check before encryption
> +    /usr/bin/busybox echo "Checking filesystem integrity..."
> +    /usr/sbin/e2fsck -f -y "${ROOT_DEV}"
> +    E2FSCK_RET=3D$?
> +    if [ ${E2FSCK_RET} -ge 4 ]; then
> +        /usr/bin/busybox echo "ERROR: Filesystem check failed"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    fi
> +
> +    # Shrink filesystem before encryption to leave room for LUKS header
> +    /usr/bin/busybox echo "Preparing filesystem for encryption..."
> +    /usr/sbin/resize2fs "${ROOT_DEV}" 368M || {
> +        /usr/bin/busybox echo "ERROR: Failed to prepare filesystem"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }
> +
> +    # Perform in-place encryption
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "Encrypting filesystem..."
> +    /usr/bin/busybox echo "This will take several minutes."
> +    /usr/bin/busybox echo "DO NOT POWER OFF THE DEVICE!"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup reencrypt --encrypt \
> +        --type luks2 \
> +        --cipher aes-xts-plain64 \
> +        --key-size 256 \
> +        --hash sha256 \
> +        --reduce-device-size 32M \
> +        --key-file - \
> +        "${ROOT_DEV}" || {
> +        /usr/bin/busybox echo "ERROR: Encryption failed"
> +        /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +        return 1
> +    }
> +
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +    /usr/bin/busybox echo "Encryption completed successfully!"
> +    /usr/bin/busybox echo "=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=3D=
=3D=3D"
> +
> +    # Remove encryption marker
> +    /usr/bin/busybox rm -f "${ENCRYPTION_MARKER}"
> +    /usr/bin/busybox sync
> +
> +    # Unlock the newly encrypted device
> +    /usr/bin/busybox echo "Activating encrypted filesystem..."
> +    /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" --ke=
y-file - || {
> +        /usr/bin/busybox echo "ERROR: Failed to activate encrypted files=
ystem"
> +        return 1
> +    }
> +
> +    # Resize filesystem to fit the encrypted device
> +    /usr/bin/busybox echo "Optimizing filesystem..."
> +    /usr/sbin/resize2fs -f "${CRYPT_DEV}" || {
> +        /usr/bin/busybox echo "ERROR: Failed to optimize filesystem"
> +        return 1
> +    }
> +
> +    # Verify filesystem after resize
> +    /usr/sbin/e2fsck -f -y "${CRYPT_DEV}" || {
> +        /usr/bin/busybox echo "WARNING: Filesystem verification had issu=
es, but continuing"
> +    }
> +    return 0
> +}
> +
> +# Function: Unlock encrypted root filesystem (subsequent boots)
> +unlock_encrypted_root() {
> +    /usr/bin/busybox echo "Unlocking encrypted filesystem..."
> +
> +    # Unseal key from TPM persistent handle
> +    LUKS_KEY=3D$(tpm_unseal_key)
> +
> +    if [ -z "${LUKS_KEY}" ]; then
> +        /usr/bin/busybox echo "ERROR: Failed to retrieve encryption key =
from TPM"
> +        /usr/bin/busybox echo "Attempting passphrase fallback..."
> +
> +        # Try to unlock with passphrase (interactive)
> +        /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" || {
> +            /usr/bin/busybox echo "ERROR: Failed to unlock encrypted fil=
esystem"
> +            /usr/bin/busybox sh
> +        }
> +    else
> +        # Unlock with unsealed key
> +        /usr/bin/busybox echo -n "${LUKS_KEY}" | \
> +            /usr/sbin/cryptsetup luksOpen "${ROOT_DEV}" "${CRYPT_NAME}" =
--key-file - || {
> +            /usr/bin/busybox echo "ERROR: Failed to unlock with TPM key"
> +            /usr/bin/busybox sh
> +        }
> +    fi
> +
> +    /usr/bin/busybox echo "Encrypted filesystem unlocked"
> +}
> +
> +# Main boot logic
> +/usr/bin/busybox echo "Checking filesystem encryption status..."
> +
> +# Check if device is LUKS encrypted
> +if /usr/sbin/cryptsetup isLuks "${ROOT_DEV}"; then
> +    /usr/bin/busybox echo "Filesystem is encrypted"
> +    unlock_encrypted_root
> +    MOUNT_DEV=3D"${CRYPT_DEV}"
> +else
> +    /usr/bin/busybox echo "Filesystem is not encrypted"
> +
> +    # Check if encryption is enabled and TPM is available
> +    if [ $TPM_AVAILABLE -eq 1 ]; then
> +        # Check for encryption marker (resume interrupted encryption)
> +        if [ -f "${ENCRYPTION_MARKER}" ]; then
> +            /usr/bin/busybox echo "Resuming interrupted encryption..."
> +            if ! encrypt_root_filesystem; then
> +                /usr/bin/busybox echo "ERROR: Failed to resume encryptio=
n"
> +                /usr/bin/busybox echo "Booting without encryption..."
> +                MOUNT_DEV=3D"${ROOT_DEV}"
> +            else
> +                MOUNT_DEV=3D"${CRYPT_DEV}"
> +            fi
> +        else
> +            # First boot - perform encryption
> +            if encrypt_root_filesystem; then
> +                MOUNT_DEV=3D"${CRYPT_DEV}"
> +            else
> +                /usr/bin/busybox echo "ERROR: Encryption failed - bootin=
g without encryption"
> +                MOUNT_DEV=3D"${ROOT_DEV}"
> +            fi
> +        fi
> +    else
> +        /usr/bin/busybox echo "TPM not available - skipping encryption"
> +        MOUNT_DEV=3D"${ROOT_DEV}"
> +    fi
> +fi
> +
> +# Unmount boot partition before switching root
> +/usr/bin/busybox umount "${BOOT_MNT}"
> +
> +# Mount root filesystem (encrypted or unencrypted)
> +/usr/bin/busybox echo "Mounting root filesystem..."
> +/usr/bin/busybox mkdir -p /newroot
> +/usr/bin/busybox mount "${MOUNT_DEV}" /newroot || {
> +    /usr/bin/busybox echo "ERROR: Failed to mount root filesystem!"
> +    /usr/bin/busybox sh
> +}
> +
> +/usr/bin/busybox echo "Boot complete"
> +
> +# Clean up tmpfs
> +/usr/bin/busybox rm -f "${TPM_PRIMARY_CTX}" "${TPM_KEY_PUB}" "${TPM_KEY_=
PRIV}" "${TPM_KEY_CTX}"
> +
> +# Switch to real root
> +exec /usr/sbin/switch_root /newroot /sbin/init
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init=
_1.0.bb b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.=
bb
> new file mode 100644
> index 00000000..7da878f7
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/initramfs-ti-encrypted-init_1.0.bb
> @@ -0,0 +1,30 @@
> +SUMMARY =3D "TI encrypted boot initramfs init script"
> +DESCRIPTION =3D "Custom /init script for encrypted boot with fTPM + LUKS=
 support"
> +
> +LICENSE =3D "MIT"
> +LIC_FILES_CHKSUM =3D "file://${COREBASE}/meta/COPYING.MIT;md5=3D3da9cfbc=
b788c80a0384361b4de20420"
> +
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}/files:"
> +FILESEXTRAPATHS:prepend :=3D "${THISDIR}/${PN}:"
> +
> +SRC_URI =3D "file://init"
> +
> +S =3D "${WORKDIR}/sources"
> +UNPACKDIR =3D "${WORKDIR}"
> +
> +# This recipe must run in the initramfs context
> +inherit allarch
> +
> +do_install() {
> +    # Install /init script to root of initramfs
> +    install -m 0755 ${UNPACKDIR}/init ${D}/init
> +}
> +
> +# Package the /init file
> +FILES:${PN} =3D "/init"
> +
> +# Runtime dependencies
> +RDEPENDS:${PN} =3D "busybox cryptsetup tpm2-tools tpm2-tss optee-client =
e2fsprogs-e2fsck e2fsprogs-resize2fs util-linux-blkid"
> +
> +# This package must be included in initramfs
> +PACKAGE_ARCH =3D "${MACHINE_ARCH}"
> diff --git a/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs=
.bb b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
> new file mode 100644
> index 00000000..314499db
> --- /dev/null
> +++ b/meta-ti-bsp/recipes-ti/initramfs/ti-encrypted-boot-initramfs.bb
> @@ -0,0 +1,50 @@
> +SUMMARY =3D "TI encrypted boot initramfs image"
> +
> +DESCRIPTION =3D "Minimal initramfs image with dm-crypt/fTPM support for =
encrypted root filesystem. \
> +This initramfs provides LUKS encryption with TPM-sealed keys stored in R=
PMB."
> +
> +LICENSE =3D "MIT"
> +
> +# Only build this when luks-encryption feature is enabled
> +COMPATIBLE_MACHINE =3D "null"
> +COMPATIBLE_MACHINE:k3 =3D "${@bb.utils.contains('MACHINE_FEATURES', 'luk=
s-encryption', '.*', 'null', d)}"
> +
> +INITRAMFS_FSTYPES =3D "cpio.gz"
> +
> +IMAGE_NAME =3D "ti-encrypted-boot-initramfs"
> +
> +export IMAGE_BASENAME =3D "${IMAGE_NAME}"
> +
> +# Install our custom init script and dependencies
> +PACKAGE_INSTALL =3D "\
> +    initramfs-ti-encrypted-init \
> +    busybox \
> +    base-passwd \
> +    kmod \
> +    cryptsetup \
> +    tpm2-tools \
> +    tpm2-tss \
> +    libtss2-tcti-device \
> +    optee-client \
> +    util-linux-blkid \
> +    e2fsprogs-e2fsck \
> +    e2fsprogs-resize2fs \
> +    kernel-module-tpm-ftpm-tee \
> +    ${ROOTFS_BOOTSTRAP_INSTALL} \
> +"
> +
> +# Ensure the initramfs only contains the bare minimum
> +IMAGE_FEATURES =3D ""
> +IMAGE_LINGUAS =3D ""
> +
> +# Exclude kernel image from initramfs
> +PACKAGE_EXCLUDE =3D "kernel-image-*"
> +
> +IMAGE_FSTYPES =3D "${INITRAMFS_FSTYPES}"
> +IMAGE_NAME_SUFFIX ?=3D ""
> +IMAGE_ROOTFS_SIZE =3D "16384"
> +IMAGE_ROOTFS_EXTRA_SPACE =3D "0"
> +
> +BAD_RECOMMENDATIONS +=3D "busybox-syslog"
> +
> +inherit image
> --
> 2.34.1
>
>
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
> Links: You receive all messages sent to this group.
> View/Reply Online (#19628): https://lists.yoctoproject.org/g/meta-ti/mess=
age/19628
> Mute This Topic: https://lists.yoctoproject.org/mt/118097473/7902621
> Group Owner: meta-ti+owner@lists.yoctoproject.org
> Unsubscribe: https://lists.yoctoproject.org/g/meta-ti/unsub [jcormier@cri=
ticallink.com]
> -=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-=3D-
>


--=20
Jonathan Cormier
Senior Software Engineer

Office:  315.425.4045 x222

http://www.CriticalLink.com
6712 Brooklawn Parkway, Syracuse, NY 13211

